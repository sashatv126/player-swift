//
//  CellofMusic.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit
import SnapKit

class CellofMusic: UITableViewCell {
    lazy var labelOfName : UILabel = {
       let label = UILabel()s
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
}
