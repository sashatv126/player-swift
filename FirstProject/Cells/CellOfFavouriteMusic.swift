//
//  CellOfFavouriteMusic.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit
import SnapKit

class CellOfFavouriteMusic : UITableViewCell {
    lazy var labelOfName : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = Constants.Fonts.font1
        return label
    }()
    lazy var labelOfArtist : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = Constants.Fonts.font2
         return label
    }()
    lazy var imageOfCover : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
}
