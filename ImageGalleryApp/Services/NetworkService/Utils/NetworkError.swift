//
//  AppDelegate.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum NetworkError: LocalizedError {
    case incorrectURL
    case unacceptableStatusCode(Int)
    
    var errorDescription: String? {
        switch self {
        case .incorrectURL:
            return "Failed to convert urlString to URL"
        case .unacceptableStatusCode(let value):
            return "Unacceptable status code \(value)"
        }
    }
    
}
