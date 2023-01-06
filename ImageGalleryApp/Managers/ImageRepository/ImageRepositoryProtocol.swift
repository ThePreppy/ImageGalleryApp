//
//  ImageRepositoryProtocol.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ImageRepositoryProtocol {
    
    func fetchImageList(
        page: Int,
        limit: Int,
        completion: @escaping (Result<[ImageModel]?, Error>) -> Void
    )
    
}
