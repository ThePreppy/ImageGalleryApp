//
//  RequestParameters.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

protocol RequestParameters: CustomDebugStringConvertible where Self: Encodable {
    func asData() -> Data?
    func asDictionary() -> [String: Any]
    func asQuery(_ value: [String: Any]?) -> String
}

extension RequestParameters {
    
    func asData() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            Logger.log("asData - \(error.localizedDescription)")
            return nil
        }
    }
    
    func asDictionary() -> [String: Any] {
        guard let data = asData() else {
            return [:]
        }
        
        do {
            guard let dictionary = try JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            ) as? [String: Any] else {
                Logger.error("asDictionary - casting to dictionary failed")
                return [:]
            }
            return dictionary
        } catch {
            Logger.error("asDictionary - \(error.localizedDescription)")
            return [:]
        }
    }
    
    func asQuery(_ value: [String: Any]? = nil) -> String {
        let dictionary = value ?? asDictionary()
        
        return dictionary
            .compactMap { (key, value) -> String? in
                if let dictionary = value as? [String: Any] {
                    return asQuery(dictionary)
                } else {
                    return "\(key)=\(value)"
                }
            }
            .joined(separator: "&")
    }
    
    var debugDescription: String {
        asData()?.prettyPrinted ?? "nil"
    }
    
}
