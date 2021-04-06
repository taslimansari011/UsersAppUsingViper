//
//  DetailsTableViewCell.swift
//  UsersAppUsingViperDesign
//
//  Created by macadmin on 05/04/21.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    func configureCell(title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}
