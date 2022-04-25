//
//  Article.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import Foundation

struct Article: Equatable {
    
    enum CodingKeys: String, CodingKey {
        
        case snippet = "snippet"
        case date = "pub_date"
        case headline = "headline"
        case multimedia = "multimedia"
        case leadParagraph = "lead_paragraph"
    }
    
    enum HeadlineCodingKeys: String, CodingKey {
        case title = "main"
    }
    
    let title:String?
    let snippet:String?
    let leadParagraph:String?
    let date:Date?
    let media:[ArticleMedia]?
    
}

extension Article: Decodable {
    
    init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        snippet = try container.decodeIfPresent(String.self, forKey: .snippet)
        leadParagraph = try container.decodeIfPresent(String.self, forKey: .leadParagraph)
        if let dateString = try container.decodeIfPresent(String.self, forKey: .date) {
            date = DateFormatter.iso8601Full.date(from: dateString)
        } else {
            date = nil
        }
        
        let headlineContainer = try container.nestedContainer(keyedBy: HeadlineCodingKeys.self, forKey: .headline)
        title = try headlineContainer.decodeIfPresent(String.self, forKey: .title)
        
        media = try container.decodeIfPresent([ArticleMedia].self, forKey: .multimedia)
    }
    
}
