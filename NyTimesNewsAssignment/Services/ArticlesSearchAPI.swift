//
//  ArticlesSearchAPI.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import Foundation
import Alamofire


struct ArticleSearchAPIData: APIData {
    
    var parameters: Parameters?
    
    init(requestParameters: Parameters?) {
        parameters = requestParameters
        if parameters == nil {
            parameters = Parameters()
        }
        parameters?["api-key"] = APIConstants.API_KEY
    }
    
    var baseURL: String {
        return APIConstants.BASE_SERVER_URL
    }

    var path: String {
        return "\(APIConstants.SEARCH)\(APIConstants.API_VERSION)\(APIConstants.ARTICLES)"
    }
    
    var fullURL: URLConvertible {
        return baseURL + path
    }

    var method: HTTPMethod? {
        return .get
    }

    var headers: HTTPHeaders? {
        return nil
    }
    
    var encoding: ParameterEncoding? {
        return URLEncoding.default
    }
}
