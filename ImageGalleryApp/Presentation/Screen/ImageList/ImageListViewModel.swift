//
//  ImageListViewModel.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation
import Kingfisher

protocol ImageListViewModelInput: AnyObject, Loadable, ErrorRepresentable {
    
    var type: ImageListType { get }
    var reloadData: Closure? { get set }
    var reloadCellAt: DataClosure<IndexPath>? { get set }
    var removeCellAt: DataClosure<IndexPath>? { get set }
    
    func refresh()
    func fetchImages()
    func setupAdapter(collectionView: IACollectionView)
    
}

class ImageListViewModel: ImageListViewModelInput {
    
    private var images: [ImageModel] = []
    private var currentPage: Int = Constants.initialPage
    private let limit: Int = Constants.limit
    private var isLoading: Bool = false
    private(set) var type: ImageListType
    
    private let router: ImageListRouterInput
    private let repository: ImageRepositoryProtocol
    private let adapter = ImageListAdapter()
    
    private var dataBaseManager: DatabaseManagerProtocol {
        Container.dataBaseManager
    }
    
    var reloadData: Closure?
    var reloadCellAt: DataClosure<IndexPath>?
    var removeCellAt: DataClosure<IndexPath>?
    
    weak var loader: LoaderRepresentable?
    
    init(
        type: ImageListType,
        repository: ImageRepositoryProtocol,
        router: ImageListRouterInput
    ) {
        self.type = type
        self.repository = repository
        self.router = router
    }
    
    func refresh() {
        adapter.sections = []
        reloadData?()
        
        currentPage = Constants.initialPage
        fetchImages()
    }
    
    func fetchImages() {
        isLoading = true
        loader?.startLoading()
        
        repository.fetchImageList(page: currentPage, limit: limit) { [weak self] result in
            self?.isLoading = false
            self?.loader?.stopLoading()
            
            switch result {
            case .success(let models):
                self?.handle(images: models)
                
            case .failure(let error):
                self?.handle(error: error)
                
            }
        }
    }
    
    func handle(error: Error?) {
        router.handle(error: error)
    }
    
    func setupAdapter(collectionView: IACollectionView) {
        collectionView.adapter = adapter
        collectionView.prefetchDataSource = adapter
        
        adapter.didReachEnd = { [weak self] in
            guard self?.isLoading == false else {
                return
            }
            
            self?.fetchImages()
        }
        
        adapter.prefetchItemsAt = { [weak self] in
            self?.prefetch(indexPaths: $0)
        }
        
        adapter.didSelectItem = { [weak self] in
            guard let image = self?.images[safe: $0.item] else {
                return
            }
            
            self?.router.showImageDetail(with: image)
        }
    }
    
    private func prefetch(indexPaths: [IndexPath]) {
        guard
            let lastItemIndex = indexPaths.last?.item,
            images.indices.contains(indexPaths.map { $0.item })
        else {
            return
        }
        
        let urls = images[0...lastItemIndex].compactMap { $0.downloadURL }
        
        ImagePrefetcher(urls: urls).start()
    }
    
    private func mapData() {
        let items = images.map { image in
            let isFavourite = dataBaseManager.isImageExists(for: image.id)
            
            return ImageCollectionCell.Model(
                url: image.downloadURL,
                isFavourite: isFavourite
            ) { [weak self] in
                self?.handleFavourite(image: image)
            }
        }
        
        adapter.sections = [IACollectionSection(items: items)]
    }
    
    private func handleFavourite(image: ImageModel) {
        guard let index = images.firstIndex(of: image) else {
            return
        }
        let indexPath = IndexPath(item: index, section: 0)
        
        let item: ImageCollectionCell.Model? = adapter.getItem(at: indexPath)
        item?.isFavourite.toggle()
        
        if item?.isFavourite == true {
            image.mapToEntity()
            dataBaseManager.save()
            
            reloadCellAt?(indexPath)
            
        } else {
            dataBaseManager.removeImage(with: image.id)
            dataBaseManager.save()
            
            if type == .favourites {
                images.remove(at: index)
                adapter.removeItem(at: indexPath)
                removeCellAt?(indexPath)
                
            } else {
                reloadCellAt?(indexPath)
                
            }
            
        }
    }
    
    private func handle(images: [ImageModel]?) {
        guard let images else {
            handle(error: EAError.somethingWentWrong)
            return
        }
        
        if currentPage == Constants.initialPage {
            
            self.images = images
        } else {
            
            self.images += images
        }
        currentPage += 1
        
        mapData()
        reloadData?()
    }
    
}

extension ImageListViewModel {
    
    private enum Constants {
        
        static let initialPage: Int = 1
        static let limit: Int = 50
        
    }
    
}
