//
//  UserDefaultsManager .swift
//  FirstProject
//
//  Created by Владимир on 23.02.2022.
//

import Foundation

class DataBase {
    
    static let shared = DataBase()
    
    enum SettingKeys : String {
        case user
    }
    let defaults = UserDefaults.standard
    let userKey = SettingKeys.user.rawValue
    var users : [User] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            }
            else {
                return [User]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data,forKey: userKey)
            }
        }
    }
    func saveUsers(username : String,email : String , password : String , repeatPassword : String)  {
        
        let user = User(usrname: username, email: email, password: password, repeatPassword: repeatPassword)
        users.append(user)
    }
}
