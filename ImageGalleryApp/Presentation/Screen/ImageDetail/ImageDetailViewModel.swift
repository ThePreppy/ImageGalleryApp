//
//  ImageDetailViewModel.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation

protocol ImageDetailViewModelInput: AnyObject, Loadable, ErrorRepresentable {
    
    var image: ImageModel { get }
    
}

class ImageDetailViewModel: ImageDetailViewModelInput {
    
    private let router: ImageDetailRouterInput
    private(set) var image: ImageModel
    
    var reloadData: Closure?
    weak var loader: LoaderRepresentable?
    
    init(image: ImageModel, router: ImageDetailRouterInput) {
        self.image = image
        self.router = router
    }
    
    func handle(error: Error?) {
        router.handle(error: error)
    }
    
}
