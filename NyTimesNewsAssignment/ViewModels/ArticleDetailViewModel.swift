//
//  ArticleDetailViewModel.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol ArticleDetailViewModelType {
    var article:BehaviorRelay<Article?> { get }
    var title: BehaviorRelay<String?> { get }
    var snippet: BehaviorRelay<String?> { get }
    var imageUrl: BehaviorRelay<String?> { get }
    var dateTime: BehaviorRelay<String?> { get }
    var leadParagraph: BehaviorRelay<String?> { get }
    
    
    init(article: Article)
    
}

class ArticleDetailViewModel: ArticleDetailViewModelType {
    var article = BehaviorRelay<Article?>(value: nil)
    var title = BehaviorRelay<String?>(value: nil)
    var snippet = BehaviorRelay<String?>(value: nil)
    var imageUrl = BehaviorRelay<String?>(value: nil)
    var dateTime = BehaviorRelay<String?>(value: nil)
    var leadParagraph = BehaviorRelay<String?>(value: nil)
    
    
    init() {}
    
    required convenience init(article: Article) {
        self.init()
        processArticle(article)
    }
    
    func processArticle(_ article: Article) {
        self.article.accept(article)
        title.accept(article.title)
        snippet.accept(article.snippet)
        leadParagraph.accept(article.leadParagraph)
        
        if let mediItem = article.media?.filter( { $0.mediaType == "tmagSF" }).first, let urlPath = mediItem.url {
            imageUrl.accept(urlPath)
        }
        
        if let date = article.date {
            dateTime.accept("Publish Date: \(DateFormatter.dateTimeSeconds.string(from: date)) (UTC)")
        } else {
            dateTime.accept("Launch time: TBD")
        }
    }
    
    
}
