//
//  APIService.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 23/04/2022.
//

import Alamofire

protocol APIServiceProtocol {
    
    @discardableResult func fetch<T: Decodable>(of type: T.Type, _ apiService: ApiService, completion: @escaping (T?, Error?, AFDataResponse<Any>?) -> Void) -> DataRequestProtocol
}

class APIService: APIServiceProtocol {
    var sessionManager: SessionProtocol
    
    // 4
    init(sessionManager: SessionProtocol = AF) {
        self.sessionManager = sessionManager
    }
    
    @discardableResult func fetch<T: Decodable>(of type: T.Type, _ apiService: ApiService, completion: @escaping (T?, Error?, AFDataResponse<Any>?) -> Void) -> DataRequestProtocol {
        
        return sessionManager.request(service: apiService)
            .responseJSON { responseData in

                guard let data = responseData.data else {
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let responseObject = try decoder.decode(T.self, from: data)
                    completion(responseObject, nil, responseData)
                } catch {
                    completion(nil, error, responseData)
                }
            }
    }
}

protocol SessionProtocol {
    func request(service: RequestableAPI) -> DataRequestProtocol
}

extension Alamofire.Session: SessionProtocol {
    func request(service: RequestableAPI) -> DataRequestProtocol {
        return request(service.fullURL, method: service.method, parameters: service.parameters, encoding: service.encoding, headers: service.headers, interceptor: nil, requestModifier: nil)
    }
}

protocol DataRequestProtocol {
    func responseJSON(completionHandler: @escaping (AFDataResponse<Any>) -> Void) -> Self
}

extension DataRequest: DataRequestProtocol {
    func responseJSON(completionHandler: @escaping (AFDataResponse<Any>) -> Void) -> Self {
        return responseJSON(queue: .main, dataPreprocessor: JSONResponseSerializer.defaultDataPreprocessor, emptyResponseCodes: JSONResponseSerializer.defaultEmptyResponseCodes, emptyRequestMethods: JSONResponseSerializer.defaultEmptyRequestMethods, options: .allowFragments, completionHandler: completionHandler)
    }
}
