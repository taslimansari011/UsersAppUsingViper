//
//  UserDetailsRouter.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 05/04/21.
//

import UIKit

class UserDetailsRouter: UserDetailsPresenterToRouterProtocols {
    
    class func createModule(with user: User) -> UserDetailsViewController {
        let presenter = UserDetailsPresenter()
        presenter.user = user

        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
