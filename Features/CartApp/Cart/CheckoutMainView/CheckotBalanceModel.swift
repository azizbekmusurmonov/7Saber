//
//  CheckotBalanceModel.swift
//  Cart
//
//  Created by Ismatillokhon on 02/07/24.
//

import Foundation
import Core

public struct TotalBalanceModel: Codable {
    public let subtotal: Double
    public let promocode: Double
    public let shipping: Double
    public let loyalty: Double
    public let total: Double
    public let currency: CurrencyModel
}
