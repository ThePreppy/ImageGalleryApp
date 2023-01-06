//
//  Domainable.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

protocol Domainable {
    associatedtype Model
    
    func mapToModel() -> Model
}

protocol ResponseDomainable: Decodable, Domainable {
    
}

extension Collection where Element: Domainable {
    
    func mapToModels() -> [Element.Model] {
        map { $0.mapToModel() }
    }
    
}
