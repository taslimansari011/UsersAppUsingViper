//
//  UsersListInteractor.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 02/04/21.
//

import Foundation
import Alamofire

class UsersListInteractor: UsersListPresenterToInteractorProtocol {
    
    var presenter: UsersListInteractorToPresenterProtocol?
    var users: [User]?
    
    func fetchUsers() {
        if let url = URL(string: Constants.url) {
            AF.request(url, method: .get, parameters: [:]).response { (response) in
                switch response.result {
                case .success(let data):
                    if let users = try? JSONDecoder().decode([User].self, from: data!) {
                        print("Response  :: \(users)")
                        self.users = users
                        self.presenter?.usersFetched()
                    }
                case .failure(let error):
                    self.presenter?.usersFetchingFailed()
                    print(error.localizedDescription)
                }
            }
        }
    }
}
