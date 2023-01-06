//
//  ImageListEndpoint.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

struct ImageListEndpoint: Endpoint {
    typealias Response = ImageResponse
    
    struct Parameters: RequestParameters {
        let page: Int
        let limit: Int
    }
    
    let page: Int
    let limit: Int
    
    var path: RequestPath {
        .imageList
    }
    
    var query: RequestParameters? {
        Parameters(page: page, limit: limit)
    }
    
}
