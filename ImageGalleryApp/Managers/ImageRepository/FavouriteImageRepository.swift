//
//  FavouriteImageRepository.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation

class FavouriteImageRepository: ImageRepositoryProtocol {
    
    func fetchImageList(
        page: Int,
        limit: Int,
        completion: @escaping (Result<[ImageModel]?, Error>) -> Void
    ) {
        let images = Container.dataBaseManager.fetchImages(page: page, limit: limit)
        
        completion(.success(images))
    }
    
}
