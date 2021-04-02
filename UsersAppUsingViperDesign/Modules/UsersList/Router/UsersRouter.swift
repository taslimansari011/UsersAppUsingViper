//
//  UsersListRouter.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 02/04/21.
//

import Foundation
import UIKit

class UsersRouter: UsersListPresenterToRouterProtocol {
    
    // MARK: - Methods
    class func createModule() -> UIViewController {
        
        let view = UsersViewController(nibName: "UsersViewController", bundle: nil)
        var presenter: UsersListViewToPresenterProtocol & UsersListInteractorToPresenterProtocol = UsersListPresenter()
        var interactor: UsersListPresenterToInteractorProtocol = UsersListInteractor()
        let router: UsersListPresenterToRouterProtocol = UsersRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
//    static var mainstoryboard: UIStoryboard {
//        return UIStoryboard(name:"Main",bundle: Bundle.main)
//    }
}
