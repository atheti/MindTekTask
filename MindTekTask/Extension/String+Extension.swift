//
//  String+Extension.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import Foundation

extension String {
    var isBlank:Bool{
        get{
            let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed.isEmpty
        }
    }

}
