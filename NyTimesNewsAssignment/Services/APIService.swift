//
//  APIService.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 23/04/2022.
//

import Alamofire

protocol APIServiceProtocol {
    
    func fetchArticlesWithSearchKeyword(_ searchKeyword:String, page:Int, completion: @escaping (ArticlesSearchResponse?, Error?, AFDataResponse<Any>?) -> Void) -> DataRequestProtocol
}

extension APIServiceProtocol {
    
    @discardableResult func fetchArticlesWithSearchKeyword(_ searchKeyword:String = "dubai", page:Int = 0, completion: @escaping (ArticlesSearchResponse?, Error?, AFDataResponse<Any>?) -> Void) -> DataRequestProtocol {
        return fetchArticlesWithSearchKeyword(searchKeyword, page: page,completion: completion)
    }
}

class APIService: APIServiceProtocol {
    var sessionManager: SessionProtocol
    
    // 4
    init(sessionManager: SessionProtocol = AF) {
        self.sessionManager = sessionManager
    }
    
    
    @discardableResult func fetchArticlesWithSearchKeyword(_ searchKeyword: String, page: Int, completion: @escaping (ArticlesSearchResponse?, Error?, AFDataResponse<Any>?) -> Void) -> DataRequestProtocol {
        
        let articleSearchApi = ArticlesAPI.articlesSearch(parameters: ["q": searchKeyword, "page": page])
        
        return sessionManager.request(service: articleSearchApi)
            .responseJSON { responseData in

                guard let data = responseData.data else {
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let articleResponse = try decoder.decode(ArticlesSearchResponse.self, from: data)
                    completion(articleResponse, nil, responseData)
                } catch {
                    completion(nil, error, responseData)
                }
            }
        
//        DispatchQueue.global().async {
//
//            let path = Bundle.main.path(forResource: "ArticleSearchSample", ofType: "json")!
//            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .iso8601
//            let articleResponse = try! decoder.decode(ArticlesSearchResponse.self, from: data)
//            completion(articleResponse, nil, nil)
//        }
        
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
