//
//  Loadable.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol Loadable {
    
    var loader: LoaderRepresentable? { get set }
    
}

protocol LoaderRepresentable: AnyObject {
    
    func startLoading()
    func stopLoading()
    
}
