//
//  ArticlesResponse.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import Foundation

struct ArticlesSearchResponse: Equatable {
    
    
    enum ResponseCodingKeys: String, CodingKey {
        case response = "response"
    }
    
    enum DocsCodingKeys: String, CodingKey {
        case docs = "docs"
    }
    
    let articles:[Article]?
}

extension ArticlesSearchResponse: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseCodingKeys.self)
        let docsContainer = try container.nestedContainer(keyedBy: DocsCodingKeys.self, forKey: .response)
        if let docs = try docsContainer.decodeIfPresent([Article].self, forKey: .docs) {
            articles = docs
        } else {
            articles = nil
        }
    }
    
}
