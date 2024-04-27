//
//  AnyDataStorage.swift
//  Core
//
//  Created by Asadbek Yoldoshev on 27/04/24.
//

import UIKit

protocol AnyDataStorage {
    func save(_ data: Any?, for key: StorageKeys)
    func remove(from key: StorageKeys)
    func update(_ data: Any, for key: StorageKeys)
    func get(from key: StorageKeys) -> Any?
}

class DataStorage {
    
    static let shared = DataStorage()
    
    var token = ""
    
    var storage: AnyDataStorage = UserDefaults.standard
}

extension UserDefaults: AnyDataStorage {
    
    func save(_ data: Any?, for key: StorageKeys) {
        UserDefaults.standard.setValue(data, forKey: key.rawValue)
    }
    
    func remove(from key: StorageKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    func update(_ data: Any, for key: StorageKeys) {
        UserDefaults.standard.setValue(data, forKey: key.rawValue)
    }
    
    func get(from key: StorageKeys) -> Any? {
        UserDefaults.standard.object(forKey: key.rawValue)
    }
}

enum StorageKeys: String {
    case isRegistrate
}
