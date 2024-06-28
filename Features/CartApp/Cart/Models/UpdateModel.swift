//
//  UpdateModel.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 11/06/24.
//

import Foundation

struct CheckSuccessModel: Codable {
    let message: String?
}

struct UpdateModel: Codable {
    let id: Int?
    let productId: Int?
    let qty: Int?
    let details: Details?
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId)
        self.qty = try container.decodeIfPresent(Int.self, forKey: .qty)
        self.details = try container.decodeIfPresent(Details.self, forKey: .details)
    }
}

struct Details: Codable {
    let colorId: Int
    let size: String
}
