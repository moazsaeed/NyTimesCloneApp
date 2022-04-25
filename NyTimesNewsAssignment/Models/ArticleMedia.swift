//
//  ArticleMedia.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation


struct ArticleMedia: Equatable  {
    let mediaType:String?
    let url:String?
    
    enum CodingKeys: String, CodingKey {
        
        case mediaType = "subType"
        case url = "url"
    }
}
extension ArticleMedia: Decodable {
    init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        mediaType = try container.decodeIfPresent(String.self, forKey: .mediaType)
        if let urlTemp = try container.decodeIfPresent(String.self, forKey: .url) {
            url = APIConstants.MEDIA_BASE_SERVER_URL + "/" + urlTemp
        } else {
            url = nil
        }
    }
    
}
