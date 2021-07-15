//
//  UIView+Extension.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as! T
    }
}
