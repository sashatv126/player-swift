//
//  CellOfFavouriteMusicViewModel.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit

struct CellOfFavouriteMusicViewModel {
    let nameOfSong : String
    let cover : UIImage?
    let nameOfArtist : String
}
let arrayOfFavMusic : [CellOfFavouriteMusicViewModel] = [CellOfFavouriteMusicViewModel(nameOfSong: "lll", cover: Constants.Image.contentBlock, nameOfArtist: "lllll")]
