//
//  USerDetailsViewController.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 05/04/21.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet var userTableView: UITableView!
    
    var presenter: UserDetailsViewToPresenterProtocols!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        registerCells()
        presenter.loadData()
    }
}

// MARK: - UserDetailsPresenterToViewProtocols
extension UserDetailsViewController: UserDetailsPresenterToViewProtocols {
    func dataFetched() {
        userTableView.reloadData()
    }
}

// MARK: - Helper methods
extension UserDetailsViewController {
    
    private func configureView() {
        userTableView.dataSource = self
    }
    
    private func registerCells() {
        userTableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
    }
}

// MARK: - UITableViewDataSource
extension UserDetailsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell {
            cell.configureCell(title: presenter.getTitle(for: indexPath.row), subTitle: presenter.getSubTitle(for: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
}
