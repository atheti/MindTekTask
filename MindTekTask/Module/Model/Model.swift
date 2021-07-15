//
//  Model.swift
//  MindTekTask
//
//  Created by Anji Atheti on 14/07/21.
//

import Foundation

struct CountryModel: Decodable {
    var name: String?
    var code: String?
    var dailCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
        case dailCode = "dial_code"
    }
}

struct ImageModel {
    var imageName: String
}

