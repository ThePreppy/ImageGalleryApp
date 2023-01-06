//
//  DataResponse.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

struct DataResponse {
    let response: URLResponse?
    let data: Data?
    let error: Error?
    
    var result: Result<Data, Error> {
        if let error {
            return .failure(error)
        }
        
        if let data {
            return .success(data)
        }
        
        return .failure(EAError.somethingWentWrong)
    }
    
}
