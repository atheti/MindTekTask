//
//  CarouselCollectionViewCell.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell, CellIdentifiable {
    @IBOutlet weak private var carouselImageVIew: UIImageView!
    
    func setImage(imageName: String) {
        carouselImageVIew.image = UIImage(named: imageName)
    }
    
}
