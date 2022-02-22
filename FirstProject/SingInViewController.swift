//
//  SingUpViewController.swift
//  FirstProject
//
//  Created by Владимир on 19.02.2022.
//

import UIKit
import SnapKit
class SignInViewController: UIViewController {
    private let cellidentifier = "cell with fav music"
    //MARK: -Views
      private  lazy var tableView : UITableView = {
           let tableView = UITableView()
        tableView.backgroundColor = .white
            return tableView
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            tableView.register(CellOfFavouriteMusic.self, forCellReuseIdentifier: cellidentifier)
            tableView.delegate = self
            tableView.dataSource = self
            setupViews()
            tableView.rowHeight = 93
        }
    //MARK: - Constraints
        private func setupViews() {
            view.addSubview(tableView)
            title = "Favourite Music"
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.snp.makeConstraints {maker in
                maker.left.right.equalToSuperview().inset(0)
                maker.bottom.top.equalToSuperview().inset(0)
            }
        }
    }
    //MARK: - Extension
    extension SignInViewController : UITableViewDelegate , UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            arrayOfFavMusic.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier) as? CellOfFavouriteMusic
            let viewmodel = arrayOfFavMusic[indexPath.row]
            cell?.configure(viewmodel)
            return cell ?? UITableViewCell()
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let new = PlayViewController()
            new.configure(arrayOfMusic, number: indexPath.row)
            self.navigationController?.pushViewController(new, animated: true)
        }
    }


