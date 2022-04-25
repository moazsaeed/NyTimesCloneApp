//
//  APISpecifications.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import Foundation
import Alamofire


/// The protocol used to define the specifications necessary for an api to be requestable.
public protocol RequestableAPI {

    var baseURL: String { get }

    var path: String { get }
    
    var fullURL: URLConvertible { get }

    var method: HTTPMethod { get }
    
    var parameters: Parameters? { get }

    var headers: HTTPHeaders? { get }
    
    var encoding: ParameterEncoding { get }
}
