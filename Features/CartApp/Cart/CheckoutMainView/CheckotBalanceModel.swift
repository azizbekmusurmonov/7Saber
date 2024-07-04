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
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.subtotal = try container.decode(Double.self, forKey: .subtotal)
        self.promocode = try container.decode(Double.self, forKey: .promocode)
        self.shipping = try container.decode(Double.self, forKey: .shipping)
        self.loyalty = try container.decode(Double.self, forKey: .loyalty)
        self.total = try container.decode(Double.self, forKey: .total)
        self.currency = try container.decode(CurrencyModel.self, forKey: .currency)
    }
}
