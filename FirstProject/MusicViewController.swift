//
//  MusicViewController.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit
import AVKit
import SnapKit

class MusicViewController: UIViewController {
//MARK: -Views
   private let cellIdentifier = "cell with Music"
    
  private  lazy var tableView : UITableView = {
       let tableView = UITableView()
    tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(CellofMusic.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        setupViews()
        tableView.rowHeight = 93
    }
    private func setupViews() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints {maker in
            maker.left.right.equalToSuperview().inset(0)
            maker.bottom.top.equalToSuperview().inset(0)
        }
    }
}
extension MusicViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CellofMusic
        let viewmodel = arrayOfMusic[indexPath.row]
        cell?.configure(viewmodel)
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = PlayViewController()
        new.configure(arrayOfMusic, number: indexPath.row)
        self.navigationController?.pushViewController(new, animated: true)
        
    }
    
}
