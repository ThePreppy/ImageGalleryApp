//
//  URLSession+Extensions.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

extension URLSession {
    
    func dataTask(
        convertible: URLRequestConvertible,
        completion: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask? {
        do {
            let request = try convertible.asURLRequest()
            return dataTask(with: request, completionHandler: completion)
            
        } catch {
            completion(nil, nil, error)
            return nil
        }
    }
    
}
