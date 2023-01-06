//
//  FavouriteImagesListBuilder.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

enum FavouriteImagesListBuilder {
    
    static func build() -> UIViewController {
        let networkService = NetworkService()
        let repository = FavouriteImageRepository()
        let router = ImageListRouter()
        
        let viewModel = ImageListViewModel(
            type: .favourites,
            repository: repository,
            router: router
        )
        let viewController = ImageListViewController(viewModel: viewModel)
        
        viewModel.loader = viewController
        router.viewController = viewController
        
        return viewController
    }
    
}
