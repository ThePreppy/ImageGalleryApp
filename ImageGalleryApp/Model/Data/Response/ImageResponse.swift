//
//  ImageResponse.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

struct ImageResponse: ResponseDomainable {
    typealias Model = ImageModel
    
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case downloadURL = "download_url"
    }
    
    func mapToModel() -> ImageModel {
        ImageModel(
            id: id,
            author: author,
            width: width,
            height: height,
            downloadURL: URL(string: downloadURL)
        )
    }
    
}
