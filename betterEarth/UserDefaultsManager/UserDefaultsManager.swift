//
//  UserDefaultsManager.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import Foundation

@propertyWrapper

struct StorageRef<T> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        } set {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}

struct AppData {
    
    @StorageRef(key: "token", defaultValue: "")
    static var token: String
}
