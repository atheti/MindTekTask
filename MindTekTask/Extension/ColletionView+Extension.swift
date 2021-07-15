//
//  ColletionView+Extension.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(cell ofType: T.Type, at indexPath: IndexPath) -> T where T: CellIdentifiable {
        return self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
