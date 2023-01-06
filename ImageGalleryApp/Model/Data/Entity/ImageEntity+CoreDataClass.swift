//
//  ImageEntity+CoreDataClass.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//
//

import Foundation
import CoreData

@objc(ImageEntity)
public class ImageEntity: NSManagedObject {

    convenience init(
        id: String,
        author: String,
        width: Int,
        height: Int,
        downloadURL: URL?
    ) {
        self.init(context: DatabaseManager.shared.context)
        self.id = id
        self.author = author
        self.width = Int16(width)
        self.height = Int16(height)
        self.downloadURL = downloadURL
    }
    
}
