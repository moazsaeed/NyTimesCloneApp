//
//  LaunchListViewController.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 22/04/2022.
//

import UIKit
import RxSwift

class ArticleListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var viewModel: ArticleListViewModelType = ArticleListViewModel()
    var disposeBag: DisposeBag!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NewYork Times"
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupListeners()
    }
    
    func setupListeners() {
        disposeBag = DisposeBag()
        
        viewModel.articleCellViewModels
            .asDriver()
            .drive(onNext: { [weak self] value in
                guard let strongSelf = self else { return }
                strongSelf.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel.isLoading
            .asDriver()
            .drive(onNext: { [weak self] value in
                guard let strongSelf = self else { return }
                if value == true {
                    strongSelf.showLoading()
                } else {
                    strongSelf.hideLoading()
                }
            }).disposed(by: disposeBag)
        
        viewModel.isLoadingNextPage
            .asDriver()
            .drive(onNext: { [weak self] value in
//                guard let strongSelf = self else { return }
//                if value == true {
//                    strongSelf.showLoading()
//                } else {
//                    strongSelf.hideLoading()
//                }
            }).disposed(by: disposeBag)
        
        viewModel.notifyError
            .asDriver()
            .drive(onNext: { [weak self] value in
                guard let strongSelf = self, let value = value else { return }
                strongSelf.showAlert(value.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    
    
}
