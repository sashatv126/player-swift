//
//  ValidTypes.swift
//  FirstProject
//
//  Created by Владимир on 22.02.2022.
//

import Foundation
extension String {
    enum ValidTypes {
        case name
        case email
        case password
    }
    enum Regex : String {
        case name = "[a-zA-Z]{3,}"
        case email = "[a-zA-Z0-9]+@[a-zA-Z]+\\.[a-zA-z]{2,}"
        case password = "[a-zA-Z0-9]{6,12}"
    }
    
    func isValid(validTypes : ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validTypes {
        case .name: regex = Regex.name.rawValue
        case .email: regex = Regex.email.rawValue
        case .password: regex = Regex.password.rawValue
        }
        return NSPredicate(format: format,regex).evaluate(with: self)
    }
}

