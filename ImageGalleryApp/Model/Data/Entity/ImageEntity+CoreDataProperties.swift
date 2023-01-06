//
//  ImageEntity+CoreDataProperties.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//
//

import Foundation
import CoreData


extension ImageEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageEntity> {
        return NSFetchRequest<ImageEntity>(entityName: "ImageEntity")
    }
    
    @NSManaged public var id: String
    @NSManaged public var author: String
    @NSManaged public var downloadURL: URL?
    @NSManaged public var width: Int16
    @NSManaged public var height: Int16
    
}

extension ImageEntity : Identifiable {
    
}

extension ImageEntity: Domainable {
    typealias Model = ImageModel
    
    func mapToModel() -> ImageModel {
        ImageModel(
            id: id,
            author: author,
            width: Int(width),
            height: Int(height),
            downloadURL: downloadURL
        )
    }
    
}
