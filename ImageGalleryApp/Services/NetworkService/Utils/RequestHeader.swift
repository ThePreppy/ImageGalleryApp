//
//  AppDelegate.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

struct RequestHeader {
    let key: String
    let value: String
}

extension RequestHeader {
    
    static let acceptJson = RequestHeader(key: "Accept", value: "application/json")
    static let contentTypeJson = RequestHeader(key: "Content-Type", value: "application/json")
    
}

extension Array where Element == RequestHeader {
    
    static let `default`: [RequestHeader] = [.acceptJson, .contentTypeJson]
    
}
