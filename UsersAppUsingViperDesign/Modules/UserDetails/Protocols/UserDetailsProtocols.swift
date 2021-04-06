//
//  UserDetailsProtocols.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 05/04/21.
//

import Foundation

protocol UserDetailsViewToPresenterProtocols: class {
    
    var user: User? { get set }
    
    func loadData()
    func getTitle(for row: Int) -> String
    func getSubTitle(for row: Int) -> String
    func getAddress() -> String
}

protocol UserDetailsPresenterToViewProtocols {
    func dataFetched()
}

protocol UserDetailsPresenterToRouterProtocols {
    static func createModule(with user: User) -> UserDetailsViewController
}
