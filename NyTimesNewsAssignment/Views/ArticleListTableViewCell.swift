//
//  LaunchListTableViewCell.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 22/04/2022.
//

import UIKit
import RxSwift
import AlamofireImage

class ArticleListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    var viewModel: ArticleListTableViewCellViewModelType = ArticleListTableViewCellViewModel()
    var disposeBag: DisposeBag!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        setupViews()
        setupListeners()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.articleImageView.image = UIImage(named: "sample0")
        disposeBag = nil
    }
    
    private func setupViews() {
        selectionStyle = .none
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
                        strongSelf.setNeedsLayout()
//                        strongSelf.layoutIfNeeded()
                    })
                }
                
                
            }).disposed(by: disposeBag)
        
    }

}
