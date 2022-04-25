//
//  LaunchListTableViewCellViewModel.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 22/04/2022.
//

import Foundation
import RxCocoa

protocol ArticleListTableViewCellViewModelType { // 1
    var article: BehaviorRelay<Article?> { get }
    var title: BehaviorRelay<String?> { get }
    var snippet: BehaviorRelay<String?> { get }
    var imageUrl: BehaviorRelay<String?> { get }
    var dateTime: BehaviorRelay<String?> { get }
    
    init(article: Article)
}

class ArticleListTableViewCellViewModel: ArticleListTableViewCellViewModelType {
    var article = BehaviorRelay<Article?>(value: nil)
    var title = BehaviorRelay<String?>(value: nil)
    var snippet = BehaviorRelay<String?>(value: nil)
    var imageUrl = BehaviorRelay<String?>(value: nil)
    var dateTime = BehaviorRelay<String?>(value: nil)
    
    init() {}
    
    required convenience init(article: Article) {
        self.init()
        self.article.accept(article)
        title.accept(article.title)
        snippet.accept(article.snippet)
        
        if let mediItem = article.media?.filter( { $0.mediaType == "tmagSF" }).first, let urlPath = mediItem.url {
            imageUrl.accept(urlPath)
        }
        
        if let date = article.date {
            dateTime.accept("Publish Date: \(DateFormatter.dateTimeSeconds.string(from: date)) (UTC)")
        } else {
            dateTime.accept("Launch time: TBD")
        }
    }
    
    public func configure(_ cell: ArticleListTableViewCell) { // 4
        cell.viewModel = self
        cell.setupListeners()
    }
}
