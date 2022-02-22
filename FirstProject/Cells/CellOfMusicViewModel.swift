//
//  CellOfMusicViewModel.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit

struct CellOfMusicViewModel {
    let cover : UIImage?
    let nameOfSong : String
    let nameOfArtist : String
    
}
let arrayOfMusic : [CellOfMusicViewModel] = [CellOfMusicViewModel(cover: Constants.Image.contentBlock, nameOfSong: "llll", nameOfArtist: "lll")]
