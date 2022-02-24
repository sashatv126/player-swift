//
//  UserModel.swift
//  FirstProject
//
//  Created by Владимир on 23.02.2022.
//

import Foundation

struct User : Codable {
    let usrname : String
    let email : String
    let password : String
    let repeatPassword : String
}
