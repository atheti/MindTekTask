//
//  CellIdentifiable.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import Foundation
import UIKit

protocol CellIdentifiable {
    static var identifier: String { get }
}

extension CellIdentifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
