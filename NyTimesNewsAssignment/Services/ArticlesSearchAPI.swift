//
//  ArticlesSearchAPI.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import Foundation
import Alamofire

enum ArticlesAPI {
    case articlesSearch(parameters:Parameters?)
}

extension ArticlesAPI: RequestableAPI {
    
    var baseURL: String {
        return APIConstants.BASE_SERVER_URL
    }

    var path: String {
        switch self {
        case .articlesSearch(_):
            let articlesSearchPath = "\(APIConstants.SEARCH)\(APIConstants.API_VERSION)\(APIConstants.ARTICLES)"
            return articlesSearchPath
        }
    }
    
    var fullURL: URLConvertible {
        return baseURL + path
    }

    var method: HTTPMethod {
        
        switch self {
        case .articlesSearch(_):
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .articlesSearch(let params):
            guard var paramsTemp = params else { return nil }
            paramsTemp["api-key"] = APIConstants.API_KEY
            return paramsTemp
        }
        
    }

    var headers: HTTPHeaders? {
        switch self {
        case .articlesSearch(_):
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .articlesSearch(_):
            return URLEncoding.default
        }
        
    }
}
