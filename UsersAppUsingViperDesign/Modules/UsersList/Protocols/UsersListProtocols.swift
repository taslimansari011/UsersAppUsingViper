//
//  UsersListProtocols.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 02/04/21.
//

import Foundation
import UIKit

// PRESENTER of UsersList module will conform to this protocol to listen to INTERACTOR ...
// Here INTERACTOR tells and PRESENTER listens:
protocol UsersListInteractorToPresenterProtocol {
    func usersFetched()
    func usersFetchingFailed()
}

// INTERACTOR of UsersList Module will confrom to this protocol to interact with PRESENTER ...
protocol UsersListPresenterToInteractorProtocol {
    var presenter: UsersListInteractorToPresenterProtocol? { get set }
    var users: [User]? { get }
    
    func fetchUsers()
}

// View of UsersList module will conform to this protocol to listen to PRESENTER ...
protocol UsersListPresenterToViewProtocol {
    func showUsers()
    func showError()
}

// PRESENTER of UsersList module will conform to this protocol
protocol UsersListViewToPresenterProtocol: class {
    var view: UsersListPresenterToViewProtocol? { get set }
    var interactor: UsersListPresenterToInteractorProtocol? { get set }
    var router: UsersListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getUsersListCount() -> Int
    func getUser(by index: Int) -> User?
    func showDetails(of user: User, viewController: UsersViewController)
}

protocol UsersListPresenterToRouterProtocol {
//    var viewController: UsersViewController! { get set }
    static func createModule() -> UsersViewController
    func pushToDetails(of user: User, viewController: UsersViewController)
}
