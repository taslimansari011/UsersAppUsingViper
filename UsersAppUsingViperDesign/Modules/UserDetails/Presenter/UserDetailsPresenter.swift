//
//  UserDetailsPresenter.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 05/04/21.
//

import Foundation

class UserDetailsPresenter: UserDetailsViewToPresenterProtocols {
    
    var user: User?
    var view: UserDetailsPresenterToViewProtocols?
    var router: UserDetailsRouter?
    
    func loadData() {
        view?.dataFetched()
    }
    
    func getTitle(for row: Int) -> String {
        switch row {
        case 0:
            return "Name"
        case 1:
            return "Username"
        case 2:
            return "Address"
        case 3:
            return "Email"
        case 4:
            return "Website"
        case 5:
            return "Phone"
        default:
            return "-"
        }
    }
    
    func getSubTitle(for row: Int) -> String {
        switch row {
        case 0:
            return user?.name ?? ""
        case 1:
            return user?.username ?? ""
        case 2:
            return getAddress()
        case 3:
            return user?.email ?? ""
        case 4:
            return user?.website ?? ""
        case 5:
            return user?.phone ?? ""
        default:
            return "-"
        }
    }
    
    func getAddress() -> String {
        return "\(user?.address?.street ?? "") \(user?.address?.suite ?? "") \(user?.address?.city ?? "") \(user?.address?.zipcode ?? "")"
    }
}
