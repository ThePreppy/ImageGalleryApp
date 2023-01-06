//
//  Coredatable.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation

protocol Coredatable {
    associatedtype ModelType: Domainable
    
    @discardableResult
    func mapToEntity() -> ModelType
}

extension Array where Element: Coredatable {
    
    func mapToEntities() -> [Element.ModelType] {
        map { $0.mapToEntity() }
    }
    
}

extension Array {

    func mapOptionalsToEntities<T: Coredatable>() -> [T.ModelType] where Element == T? {
        compactMap { $0?.mapToEntity() }
    }
    
}
