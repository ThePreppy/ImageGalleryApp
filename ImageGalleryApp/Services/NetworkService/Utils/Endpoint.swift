//
//  AppDelegate.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

protocol URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest
    
}

protocol URLConvertible {
    
    func asURL() throws -> URL
    
}

protocol Endpoint: URLRequestConvertible, URLConvertible {
    associatedtype Response: ResponseDomainable
    
    var scheme: String { get }
    var domain: String { get }
    var path: RequestPath { get }
    var method: HTTPMethod { get }
    var headers: [RequestHeader] { get }
    var body: RequestParameters? { get }
    var query: RequestParameters? { get }
}

extension Endpoint {
    var scheme: String { "https://" }
    var domain: String { "picsum.photos/v2" }
    var method: HTTPMethod { .get }
    var headers: [RequestHeader] { .default }
    var body: RequestParameters? { nil }
    var query: RequestParameters? { nil }
    
    func asURL() throws -> URL {
        try proceedURL()
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try proceedURL()
        var result = URLRequest(url: url)
        result.httpMethod = method.rawValue
        result.httpBody = body?.asData()
        
        headers.forEach {
            result.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return result
    }
    
    private func proceedURL() throws -> URL {
        var urlString = scheme + domain + path.rawValue
        if let query { urlString += "?\(query.asQuery())" }
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.incorrectURL
        }
        
        return url
    }
}
