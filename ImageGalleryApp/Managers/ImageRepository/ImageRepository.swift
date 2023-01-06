//
//  ImageRepository.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

class ImageRepository: ImageRepositoryProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchImageList(
        page: Int,
        limit: Int,
        completion: @escaping (Result<[ImageModel]?, Error>) -> Void
    ) {
        let endpoint = ImageListEndpoint(
            page: page,
            limit: limit
        )
        
        networkService.loadModels(endpoint: endpoint) {
            
            switch $0 {
            case .success(let model):
                completion(.success(model))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
            
        }
    }
    
}
