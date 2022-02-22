//
//  CellofMusic.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit
import SnapKit

class CellofMusic: UITableViewCell {
//MARK: -Views
    lazy var labelOfName : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = Constants.Fonts.font1
        return label
    }()
    lazy var labelOfArtist : UILabel = {
        let label = UILabel()
         return label
    }()
    lazy var imageOfCover : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
//MARK: -Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageOfCover)
        contentView.addSubview(labelOfName)
        contentView.addSubview(labelOfArtist)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(_ viewModel : CellOfMusicViewModel)  {
        labelOfName.text = viewModel.nameOfSong
        labelOfArtist.text = viewModel.nameOfArtist
        imageOfCover.image = viewModel.cover
    }
//MARK: -Constraints
    private func setupConstraints() {
        
        imageOfCover.snp.makeConstraints{ maker in
            maker.width.equalTo(70)
            maker.height.equalTo(70)
            maker.right.equalTo(contentView).inset(280)
            maker.bottom.equalTo(contentView).inset(10)
            maker.top.equalTo(contentView).inset(10)
        }
        labelOfName.snp.makeConstraints{maker in
            maker.top.equalTo(contentView).inset(16)
            maker.left.equalTo(imageOfCover).inset(130)
            maker.width.equalTo(57)
            maker.height.equalTo(19)
        }
        labelOfArtist.snp.makeConstraints{maker in
            maker.top.equalTo(labelOfName).inset(27)
            maker.left.equalTo(imageOfCover).inset(130)
            maker.width.equalTo(269)
            maker.height.equalTo(34)
        }
    }
}
