//
//  MusicViewController.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit
import AVKit

class MusicViewController: UIViewController {
//MARK: -Views
   private let cellIdentifier = "cell with Music"
    
  private  lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.register(CellofMusic.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
extension MusicViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}
