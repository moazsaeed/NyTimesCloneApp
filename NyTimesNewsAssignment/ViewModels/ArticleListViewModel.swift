//
//  File.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 23/04/2022.
//

import Foundation
import RxCocoa


protocol ArticleListViewModelType {
    var articleCellViewModels: BehaviorRelay<[ArticleListTableViewCellViewModel]> { get }
    var notifyError: BehaviorRelay<Error?> { get }
    var isLoading: BehaviorRelay<Bool> { get }
    var isLoadingNextPage: BehaviorRelay<Bool> { get }
    var pageNumber:Int { get }
    
    func fetchSearchArticles()
    func fetchNextPageArticles()
}

class ArticleListViewModel: ArticleListViewModelType {
    let apiService: APIServiceProtocol
    
    var articleCellViewModels = BehaviorRelay<[ArticleListTableViewCellViewModel]>(value: [])
    var notifyError = BehaviorRelay<Error?>(value: nil)
    var isLoading = BehaviorRelay<Bool>(value: false)
    var isLoadingNextPage = BehaviorRelay<Bool>(value: false)
    var pageNumber = 1
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
        fetchSearchArticles()
    }
    
    func fetchSearchArticles() {
        if pageNumber < 2 {
            isLoading.accept(true)
        } else {
            isLoadingNextPage.accept(true)
        }
        
        _ = apiService.fetchArticlesWithSearchKeyword("dubai", page: pageNumber) { [weak self] articleResponse, error, responseData in
                
            guard let strongSelf = self else { return }
            if strongSelf.pageNumber < 2 {
                strongSelf.isLoading.accept(false)
            } else {
                strongSelf.isLoadingNextPage.accept(false)
            }
            
            if let articleResponse = articleResponse {
                strongSelf.processFetchedArticles(articleResponse: articleResponse)
                
            } else if let error = error {
                strongSelf.notifyError.accept(error)
            }
        }
    }
    
    func fetchNextPageArticles() {
        pageNumber += 1
        fetchSearchArticles()
    }
    
    func processFetchedArticles(articleResponse: ArticlesSearchResponse) {
        guard let articles = articleResponse.articles else { return }
        let nextArticlesViewModels = convertArticlesToArticleListTableViewCellViewModels(articles: articles)
        var oldValues = articleCellViewModels.value
        oldValues.append(contentsOf: nextArticlesViewModels)
        articleCellViewModels.accept(oldValues)
    }
    
    func convertArticlesToArticleListTableViewCellViewModels(articles: [Article]) -> [ArticleListTableViewCellViewModel] {
        var cellViewModels: [ArticleListTableViewCellViewModel] = []
        for article in articles {
            cellViewModels.append(ArticleListTableViewCellViewModel(article: article))
        }
        return cellViewModels
    }
    
    
}










