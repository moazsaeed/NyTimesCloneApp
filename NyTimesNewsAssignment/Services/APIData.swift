//
//  APIData.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 09/05/2022.
//

import Foundation
import Alamofire

/// The protocol used to define the specifications necessary for an api to be requestable.
public protocol APIData {
    var baseURL: String { get }

    var path: String { get }
    
    var fullURL: URLConvertible { get }

    var method: HTTPMethod? { get }
    
    var parameters: Parameters? { get }

    var headers: HTTPHeaders? { get }
    
    var encoding: ParameterEncoding? { get }
    
    init(requestParameters: Parameters?)
    
}

extension APIData {
    var baseURL: String {
        return APIConstants.BASE_SERVER_URL
    }
    
    var fullURL: URLConvertible {
        return baseURL + path
    }

    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
}
