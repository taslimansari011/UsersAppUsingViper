import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: UsersListViewToPresenterProtocol! = UsersListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        registerCell()
        presenter.updateView()
    }
    
    private func initialSetup() {
        self.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "UsersListTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersListTableViewCell")
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getUsersListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UsersListTableViewCell", for: indexPath) as? UsersListTableViewCell {
            if let user = presenter.getUser(by: indexPath.row) {
                cell.setCell(title: user.name ?? "", author: user.email ?? "", description: user.website ?? "")
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension UsersViewController: UsersListPresenterToViewProtocol {
    func showUsers() {
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
        present(alert, animated: true)
    }
}
