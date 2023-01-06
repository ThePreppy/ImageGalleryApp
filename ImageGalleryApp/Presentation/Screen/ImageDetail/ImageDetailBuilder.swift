//
//  ImageDetailBuilder.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

enum ImageDetailBuilder {
    
    static func build(with image: ImageModel) -> UIViewController {
        let router = ImageDetailRouter()
        let viewModel = ImageDetailViewModel(image: image, router: router)
        let viewController = ImageDetailViewController(viewModel: viewModel)
        
        viewModel.loader = viewController
        router.viewController = viewController
        
        return viewController
    }
    
}
