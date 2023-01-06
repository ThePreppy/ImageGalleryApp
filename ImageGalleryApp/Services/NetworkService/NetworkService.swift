//
//  NetworkService.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    private let jsonDecoder: JSONDecoder
    private let successStatusCodes: [StatusCode]
    
    required init(
        jsonDecoder: JSONDecoder = JSONDecoder(),
        successStatusCodes: [StatusCode] = .successStatusCodes
    ) {
        self.jsonDecoder = jsonDecoder
        self.successStatusCodes = successStatusCodes
    }
    
    @discardableResult
    func loadModel<T: Endpoint>(
        endpoint: T,
        completion: @escaping (Result<T.Response.Model?, Error>) -> Void
    ) -> URLSessionTask? {
        
        let task = createRequest(endpoint: endpoint) { [weak self] in
            
            switch $0.result {
            case .success(let data):
                let model = self?.mapModel(endpoint: endpoint, data: data)
                
                DispatchQueue.main.async {
                    completion(.success(model))
                }
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
            }
            
        }
        
        task?.resume()
        return task
    }
    
    @discardableResult
    func loadModels<T: Endpoint>(
        endpoint: T,
        completion: @escaping (Result<[T.Response.Model]?, Error>) -> Void
    ) -> URLSessionTask? {
        
        let task = createRequest(endpoint: endpoint) { [weak self] in
            
            switch $0.result {
            case .success(let data):
                let model = self?.mapModels(endpoint: endpoint, data: data)
                
                DispatchQueue.main.async {
                    completion(.success(model))
                }
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
            }
            
        }
        
        task?.resume()
        return task
    }
    
    private func createRequest<T: Endpoint>(
        endpoint: T,
        completion: @escaping DataClosure<DataResponse>
    ) -> URLSessionDataTask? {
        
        let task = URLSession.shared.dataTask(convertible: endpoint) {
            [weak self] data, response, error in
            
            self?.logging(
                endpoint: endpoint,
                response: response,
                data: data
            )
            
            let validationError = self?.validateResponse(response: response)
            
            completion(DataResponse(
                response: response,
                data: data,
                error: validationError != nil ? validationError : error
            ))
        }
        
        return task
    }
    
    private func validateResponse(response: URLResponse?) -> Error? {
        guard let httpResponse = response as? HTTPURLResponse else {
            return nil
        }
        let code = httpResponse.statusCode
        
        guard !successStatusCodes.contains(StatusCode(value: code)) else {
            return nil
        }
        
        return NetworkError.unacceptableStatusCode(code)
    }
    
    private func mapModel<T: Endpoint>(endpoint: T, data: Data) -> T.Response.Model? {
        do {
            let responseModel = try jsonDecoder.decode(T.Response.self, from: data)
            let model = responseModel.mapToModel()
            
            return model
            
        } catch {
            Logger.error(error)
            return nil
            
        }
    }
    
    private func mapModels<T: Endpoint>(endpoint: T, data: Data) -> [T.Response.Model]? {
        do {
            let responseModel = try jsonDecoder.decode([T.Response].self, from: data)
            let model = responseModel.mapToModels()
            
            return model
            
        } catch {
            Logger.error(error)
            return nil
            
        }
    }
    
    private func logging(
        endpoint: any Endpoint,
        response: URLResponse?,
        data: Data?
    ) {
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        let request = try? endpoint.asURLRequest()
        
        Logger.log("----------------🌍 [NetworkService] - \(String(describing: type(of: endpoint.self)))----------------")
        Logger.log("URL: \(request?.url?.absoluteString ?? "nil")")
        Logger.log("Headers: \(request?.allHTTPHeaderFields ?? [:])")
        Logger.log("HTTPMethod: \(request?.httpMethod ?? "nil")")
        Logger.log("Query: \(endpoint.query.debugDescription)")
        Logger.log("Body: \(endpoint.body.debugDescription)")
        Logger.log("🟦 [NetworkService] - Response")
        Logger.log("Status code: \(statusCode ?? 0)")
        Logger.log("Response: \(data?.prettyPrinted ?? "nil")")
    }
    
}
