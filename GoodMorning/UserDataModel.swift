//
//  UserDataModel.swift
//  GoodMorning
//
//  Created by Thomas Legge on 23/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import Foundation

class UserData: NSObject, Codable {
    var isFirstTimeStartup: Bool? = false
    var name: String?
    var city: String?
}
