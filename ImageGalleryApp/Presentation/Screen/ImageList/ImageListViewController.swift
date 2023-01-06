//
//  ImageListViewController.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit
import Kingfisher

class ImageListViewController: EAViewController {
    
    private lazy var collectionView: IACollectionView = {
        let result = IACollectionView()
        result.setCollectionViewLayout(createLayout(), animated: false)
        result.backgroundColor = .clear
        result.registerCell(ImageCollectionCell.self)
        
        viewModel.setupAdapter(collectionView: result)
        
        return result
    }()
    
    let viewModel: ImageListViewModelInput
    
    init(viewModel: ImageListViewModelInput) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.refresh()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        setupUI()
        setupListeners()
    }
    
    private func setupUI() {
        navigationItem.title = viewModel.type.title
        
        collectionView.addToSuperview(view) {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupListeners() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.removeCellAt = { [weak self] indexPath in
            self?.collectionView.performBatchUpdates {
                self?.collectionView.deleteItems(at: [indexPath])
            }
        }
        
        viewModel.reloadCellAt = { [weak self] in
            self?.collectionView.reloadItems(at: [$0])
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemDimension = NSCollectionLayoutDimension.fractionalWidth(1 / CGFloat(Constants.numberOfItemsInRow))
        let itemSize = NSCollectionLayoutSize(
            widthDimension: itemDimension,
            heightDimension: itemDimension
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(10)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: Constants.numberOfItemsInRow
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}

extension ImageListViewController {
    
    private enum Constants {
        
        static let numberOfItemsInRow: Int = 3
        
    }
    
}
