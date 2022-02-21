//
//  SingUpViewController.swift
//  FirstProject
//
//  Created by Владимир on 19.02.2022.
//

import UIKit

class SignInViewController: UIViewController {
//MARK: -Views
    private let cellIdentifier = "cells"
        
        
   private lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .white
    tableView.register(CellOfFavouriteMusic.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
}

