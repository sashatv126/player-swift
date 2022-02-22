//
//  AboutMeViewController.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit

class MoreViewController: UIViewController {
    lazy var scrollView : UIScrollView = {
       let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var labelOfemail : UILabel = {
        let label = UILabel()
         label.textColor = .black
        label.text = "efowefjoiw"
         label.numberOfLines = 0
         label.font = Constants.Fonts.font1
         return label
    }()
    lazy var labelOfUser : UILabel = {
        let label = UILabel()
         label.textColor = .black
        label.text = "efowefjoiw"
         label.numberOfLines = 0
         label.font = Constants.Fonts.font1
         return label
    }()
    lazy var buttonOfPlay : UIButton = {
        let button = UIButton(type: .system, primaryAction: nil)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    func configure(_ array : [CellOfMusicViewModel],number : Int) {
    }
    private func setupConstraints() {
        scrollView.snp.makeConstraints{maker in
            maker.left.right.equalToSuperview()
            maker.top.bottom.equalToSuperview()
        }
        buttonOfPlay.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(scrollView).inset(50)
            maker.left.right.equalTo(scrollView).inset(20)
            maker.height.equalTo(350)
            maker.width.equalTo(300)
        }
        labelOfUser.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(buttonOfPlay).inset(380)
            maker.height.equalTo(30)
            maker.left.right.equalTo(scrollView).inset(20)
        }
        labelOfemail.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            
            maker.top.equalTo(labelOfUser).inset(60)
            maker.left.right.equalTo(scrollView).inset(20)
        }
    }
    private func setupViews() {
        title = "Profile" 
        view.addSubview(scrollView)
        scrollView.addSubview(labelOfUser)
        scrollView.addSubview(labelOfemail)
        scrollView.addSubview(buttonOfPlay)
    }
    
}
