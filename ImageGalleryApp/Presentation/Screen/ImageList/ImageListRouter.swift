//
//  ImageListRouter.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

protocol ImageListRouterInput: AnyObject, ErrorRepresentable {
    
    var viewController: EAViewController? { get set }
    
    func showImageDetail(with image: ImageModel)
    
}

class ImageListRouter: ImageListRouterInput {
    
    weak var viewController: EAViewController?
    
    func handle(error: Error?) {
        viewController?.handle(error: error)
    }
    
    func showImageDetail(with image: ImageModel) {
        let detailViewController = ImageDetailBuilder.build(with: image)
        
        viewController?
            .navigationController?
            .pushViewController(detailViewController, animated: true)
    }
    
}
