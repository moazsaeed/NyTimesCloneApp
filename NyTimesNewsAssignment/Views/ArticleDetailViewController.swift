//
//  ArticleDetailViewController.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//


import UIKit
import RxSwift
import AlamofireImage

class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var viewModel: ArticleDetailViewModelType = ArticleDetailViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupListeners()
    }
    
    //here setting the listners to receive events for UI UPdate
    func setupListeners() {
        disposeBag = DisposeBag()
        
        viewModel.title
            .asDriver()
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.snippet
            .asDriver()
            .drive(snippetLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.leadParagraph
            .asDriver()
            .drive(detailLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.dateTime
            .asDriver()
            .drive(dateTimeLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.imageUrl
            .asDriver()
            .drive(onNext: { [weak self] value in
                guard let strongSelf = self else { return }
                if let urlsTr = value, let imageUrl = URL(string: urlsTr) {
                    strongSelf.articleImageView.af.setImage(withURL: imageUrl, placeholderImage: UIImage(named: "sample0"), completion:  { [weak self] (_)  in
                        guard let strongSelf = self else { return }
                        strongSelf.articleImageView.layoutIfNeeded()
                    })
                }
                
                
            }).disposed(by: disposeBag)
        
    }

}
