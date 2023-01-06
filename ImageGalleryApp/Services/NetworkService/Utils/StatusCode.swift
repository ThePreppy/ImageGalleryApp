//
//  StatusCode.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

struct StatusCode {
    let value: Int
}

extension StatusCode: Equatable {
    
}

extension Array where Element == StatusCode {
    
    static let successStatusCodes: [StatusCode] = (200..<300).map { StatusCode(value: $0) }
    
    var rawValues: [Int] {
        map { $0.value }
    }
    
}
