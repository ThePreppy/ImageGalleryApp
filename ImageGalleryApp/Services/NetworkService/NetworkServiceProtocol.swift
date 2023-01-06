//
//  NetworkServiceProtocol.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    
    init(jsonDecoder: JSONDecoder, successStatusCodes: [StatusCode])
    
    @discardableResult
    func loadModel<T: Endpoint>(
        endpoint: T,
        completion: @escaping (Result<T.Response.Model?, Error>) -> Void
    ) -> URLSessionTask?
    
    @discardableResult
    func loadModels<T: Endpoint>(
        endpoint: T,
        completion: @escaping (Result<[T.Response.Model]?, Error>) -> Void
    ) -> URLSessionTask?
    
}
