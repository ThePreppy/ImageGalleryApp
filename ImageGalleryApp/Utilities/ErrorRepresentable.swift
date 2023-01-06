//
//  ErrorRepresentable.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ErrorRepresentable: AnyObject {
    
    func handle(error: Error?)
    
}
