//
//  MusicViewController.swift
//  FirstProject
//
//  Created by Владимир on 21.02.2022.
//

import UIKit
import SnapKit

class MusicViewController: UIViewController {

    private let cellIdentifier = "cell with Music"
//MARK: -Views
  private  lazy var tableView : UITableView = {
       let tableView = UITableView()
    tableView.backgroundColor = .white
        return tableView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchController()
        tableView.register(CellofMusic.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchBar.delegate = self
        setupViews()
        tableView.rowHeight = 93
    }
//MARK: - Constraints
    private func setupViews() {
        view.addSubview(tableView)
        title = "Music"
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints {maker in
            maker.left.right.equalToSuperview().inset(0)
            maker.bottom.top.equalToSuperview().inset(0)
        }
    }
    private func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
    }
}
//MARK: - Extension
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
extension MusicViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
