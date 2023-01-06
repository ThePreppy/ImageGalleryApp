//
//  ImageModel+Coredatable.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation

extension ImageModel: Coredatable {
    typealias ModelType = ImageEntity
    
    @discardableResult
    func mapToEntity() -> ImageEntity {
        ImageEntity(
            id: id,
            author: author,
            width: width,
            height: height,
            downloadURL: downloadURL
        )
    }
    
}
