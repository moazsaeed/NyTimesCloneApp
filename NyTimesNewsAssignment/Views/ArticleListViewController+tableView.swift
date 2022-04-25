//
//  ArticleListViewController+tableView.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation
import UIKit

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return max(viewModel.articleCellViewModels.value.count, 1)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard viewModel.articleCellViewModels.value.count > 0 else {
            return UITableViewCell()
        }
        return listingCell(tableView, indexPath) // 3
    }
    
    
    private func listingCell(_ tableView: UITableView, _ indexPath: IndexPath) -> ArticleListTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    "\(ArticleListTableViewCell.self)") as! ArticleListTableViewCell
        let vm = viewModel.articleCellViewModels.value[indexPath.row]
        vm.configure(cell)
        return cell
    }
}

extension ArticleListViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = viewModel.articleCellViewModels.value[indexPath.row].article.value else { return }
        let articleDetailVC = ArticleDetailViewController.instanceFromStoryboard()
        articleDetailVC.viewModel = ArticleDetailViewModel(article: article)
        navigationController?.pushViewController(articleDetailVC, animated: true) 
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.articleCellViewModels.value.count - 3 {
            self.viewModel.fetchNextPageArticles()
            }
        }
}
