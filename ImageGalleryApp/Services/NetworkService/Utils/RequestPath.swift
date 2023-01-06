//
//  RequestPath.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum RequestPath {
    case imageList
    
    var rawValue: String {
        switch self {
        case .imageList:
            return "/list"
        }
    }
    
}
