//
//  PlayViewController.swift
//  FirstProject
//
//  Created by Владимир on 22.02.2022.
//

import UIKit
import AVKit
import SnapKit
class PlayViewController: UIViewController {
//MARK: -Views
    lazy var scrollView : UIScrollView = {
       let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var buttonOfPlay : UIButton = {
        let button = UIButton(type: .system, primaryAction: nil)
        button.tintColor = .black
        button.setImage(Constants.Image.play, for : .normal )
        return button
    }()
    lazy var labelOfName : UILabel = {
        let label = UILabel()
         label.textColor = .black
        label.text = "efowefjoiw"
         label.numberOfLines = 0
         label.font = Constants.Fonts.font1
         return label
    }()
    lazy var imageOfCover : UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image = UIImageView(image: Constants.Image.contentBlock)
        return image
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
        imageOfCover.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(scrollView).inset(50)
            maker.height.equalTo(300)
            maker.width.equalTo(300)
        }
        labelOfName.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(imageOfCover).inset(350)
            maker.height.equalTo(30)
        }
        buttonOfPlay.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(labelOfName).inset(70)
            maker.height.equalTo(100)
            maker.width.equalTo(100)
        }
    }
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(labelOfName)
        scrollView.addSubview(buttonOfPlay)
        scrollView.addSubview(imageOfCover)
    }
    
}
