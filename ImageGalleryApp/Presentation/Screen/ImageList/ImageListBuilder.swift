//
//  ImageListBuilder.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

enum ImageListBuilder {
    
    static func build() -> UIViewController {
        let networkService = NetworkService()
        let repository = ImageRepository(networkService: networkService)
        let router = ImageListRouter()
        
        let viewModel = ImageListViewModel(
            type: .all,
            repository: repository,
            router: router
        )
        let viewController = ImageListViewController(viewModel: viewModel)
        
        viewModel.loader = viewController
        router.viewController = viewController
        
        return viewController
    }
    
}
