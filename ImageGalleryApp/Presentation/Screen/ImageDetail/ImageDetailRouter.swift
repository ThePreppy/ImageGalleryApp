//
//  ImageDetailRouter.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

protocol ImageDetailRouterInput: AnyObject, ErrorRepresentable {
    
    var viewController: EAViewController? { get set }
    
}

class ImageDetailRouter: ImageDetailRouterInput {
    
    weak var viewController: EAViewController?
    
    func handle(error: Error?) {
        viewController?.handle(error: error)
    }
    
}
