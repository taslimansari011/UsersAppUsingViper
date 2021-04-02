//
//  UsersListPresenter.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 02/04/21.
//

import Foundation

class UsersListPresenter: UsersListViewToPresenterProtocol {

    var view: UsersListPresenterToViewProtocol?
    var interactor: UsersListPresenterToInteractorProtocol?
    var router: UsersListPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchUsers()
    }
    
    func getUsersListCount () -> Int {
        return interactor?.users?.count ?? 0
    }
    
    func getUser(by index: Int) -> User? {
        return interactor?.users?[index]
    }
}

extension UsersListPresenter: UsersListInteractorToPresenterProtocol {
    func usersFetched() {
        view?.showUsers()
    }
    
    func usersFetchingFailed() {
        view?.showError()
    }
}
