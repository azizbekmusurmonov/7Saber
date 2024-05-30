//
//  AnyDataStorage.swift
//  Core
//
//  Created by Asadbek Yoldoshev on 27/04/24.
//

import UIKit

public protocol AnyDataStorage {
    func save(_ data: Any?, for key: StorageKeys)
    func remove(from key: StorageKeys)
    func update(_ data: Any, for key: StorageKeys)
    func get(from key: StorageKeys) -> Any?
}

public final class DataStorage {
    
    public static let shared = DataStorage()
    
    public var token = ""
    
    public static let storage: AnyDataStorage = UserDefaults.standard
}

extension UserDefaults: AnyDataStorage {
    
    public func save(_ data: Any?, for key: StorageKeys) {
        UserDefaults.standard.setValue(data, forKey: key.rawValue)
    }
    
    public func remove(from key: StorageKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    public func update(_ data: Any, for key: StorageKeys) {
        UserDefaults.standard.setValue(data, forKey: key.rawValue)
    }
    
    public func get(from key: StorageKeys) -> Any? {
        UserDefaults.standard.object(forKey: key.rawValue)
    }
}

public enum StorageKeys: String {
    case isShowedOnBoarding
    case isRegistrate
    case token
    case language
}
