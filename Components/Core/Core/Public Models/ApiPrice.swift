//
//  ApiPrice.swift
//  Core
//
//  Created by Ismatillokhon on 03/07/24.
//

import Foundation

public struct ApiPrice: Codable {
    public let currency: String
    public let value: Int
    
    public var display: String {
        Double(value).moneyFormat(currency: currency)
    }
}
