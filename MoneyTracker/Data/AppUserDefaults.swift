//
//  AppUserDefaults.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 13.07.2022.
//

import Foundation
struct AppUserDefaults {
    @UserDefault("currency", defaultValue: "$")
    static var currency: String
    @UserDefault("currencyIndex", defaultValue: 0)
    static var currencyIndex: Int
}
