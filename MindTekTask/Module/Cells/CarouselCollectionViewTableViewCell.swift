//
//  CarouselCollectionTableViewCell.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import UIKit

class CarouselCollectionViewTableViewCell: UITableViewCell, CellIdentifiable {
    
    @IBOutlet weak private var carouselCollectionView: UICollectionView!
    @IBOutlet weak private var carouselPageControll: UIPageControl!
    
    private var carouselImages: [ImageModel] = []
    
    func setupCollectionView(images: [ImageModel]) {
        carouselImages = images
        carouselCollectionView.setContentOffset(carouselCollectionView.contentOffset, animated: false)
        carouselCollectionView.reloadData()
    }
    
}

extension CarouselCollectionViewTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cell: CarouselCollectionViewCell.self, at: indexPath)
        let model = carouselImages[indexPath.row]
        cell.setImage(imageName: model.imageName)
        return cell
    }
    
}

extension CarouselCollectionViewTableViewCell: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        carouselPageControll.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

extension CarouselCollectionViewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}
