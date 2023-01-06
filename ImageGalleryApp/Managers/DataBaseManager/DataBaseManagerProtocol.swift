//
//  DataBaseManagerProtocol.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation

protocol DatabaseManagerProtocol: AnyObject {
    func save()
    func isImageExists(for id: String) -> Bool
    func removeImage(with id: String)
    func fetchImages() -> [ImageModel]
    func fetchImages(page: Int, limit: Int) -> [ImageModel]
}
