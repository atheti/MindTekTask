//
//  CountryTableViewCell.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import UIKit

class CountryTableViewCell: UITableViewCell, CellIdentifiable {

    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak private var countryLabel: UILabel!
    
    func setupCountryLabel(name: String?) {
        countryLabel?.text = name
    }

}
