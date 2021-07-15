//
//  TableView+Extension.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import Foundation
import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cell ofType: T.Type, at indexPath: IndexPath) -> T where T: CellIdentifiable {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
