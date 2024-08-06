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
    
    public var isRegistrated: Bool { (DataStorage.storage.get(from: .token) as? String)?.isEmpty == false }
    
    public static let storage: AnyDataStorage = UserDefaults.standard
    
    public let language: AppLanguage = AppLanguage(rawValue: DataStorage.storage.get(from: .language) as? String ?? "uz") ?? .uz
    
    public var isUzbekistan: Bool = true
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
    case selectedCountry
}

public enum AppLanguage: String, CaseIterable {
    case uz
    case ru
    case en
}
