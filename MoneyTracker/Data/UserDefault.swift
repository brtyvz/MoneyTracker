//
//  UserDefault.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 13.07.2022.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key : String
    let defaultValue : T
    
    init(_ key: String,defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ??
            defaultValue
        }
        set {
            UserDefaults.standard.set(newValue,forKey: key)
        }
    }
}
