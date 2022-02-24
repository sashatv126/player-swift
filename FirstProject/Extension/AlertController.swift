//
//  AlertController.swift
//  FirstProject
//
//  Created by Владимир on 23.02.2022.
//

import UIKit

extension UIViewController {
    
    func aleartController (title : String, message : String, action : String){
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dis = UIAlertAction(title: "OK", style: .default, handler: {_ in self.dismiss(animated: true, completion: nil)})
        let ok = UIAlertAction(title: "OK", style: .default)
        switch action {
        case "dismiss": alert.addAction(dis)
        case "OK" : alert.addAction(ok)
        default:
            break
        }
        present(alert,animated: true, completion: nil)
   }
}
enum Alerts {
    
}
