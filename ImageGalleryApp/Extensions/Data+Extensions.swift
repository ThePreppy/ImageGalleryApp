//
//  Data+Extensions.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

extension Data {
    
    var prettyPrinted: String? {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        
        return prettyPrintedString
    }
    
}
