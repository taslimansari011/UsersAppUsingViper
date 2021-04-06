//
//  UsersListRouter.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 02/04/21.
//

import Foundation
import UIKit

class UsersRouter: UsersListPresenterToRouterProtocol {
    
//    var viewController: UsersViewController!
    
    // MARK: - Methods
    static func createModule() -> UsersViewController {
        
        let viewController = UsersViewController(nibName: "UsersViewController", bundle: nil)
        var presenter: UsersListViewToPresenterProtocol & UsersListInteractorToPresenterProtocol = UsersListPresenter()
        var interactor: UsersListPresenterToInteractorProtocol = UsersListInteractor()
        let router: UsersListPresenterToRouterProtocol = UsersRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
    func pushToDetails(of user: User, viewController: UsersViewController) {
        viewController.navigationController?.pushViewController(UserDetailsRouter.createModule(with: user), animated: true)
    }
}
