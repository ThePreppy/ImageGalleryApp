//
//  ImageModel.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

struct ImageModel {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let downloadURL: URL?
}

extension ImageModel: Equatable {
    
}
