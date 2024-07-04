//
//  PromocodeModel.swift
//  Cart
//
//  Created by Ismatillokhon on 03/07/24.
//

import Foundation
import Core

// Root struct
struct ApiPromocode: Codable {
    let message: String
//    let products: [CartModel]
    let promocode: PromocodeModel?
}


// Promocode struct
struct PromocodeModel: Codable {
    let attached: Int?
    let catalogId: Int?
    let categoryId: String?
    let createdBy: Int?
    let createdAt: String?
    let expireAt: String?
    let id: Int?
    let isActive: Bool?
    let limit: Int?
    let productId: String?
    let promocode: String?
    let qty: Int?
    let titleEn: String?
    let titleRu: String?
    let titleUz: String?
    let type: Int?
    let updatedBy: Int?
    let updatedAt: String?
    let userId: String?

    // Coding keys to map the JSON keys to the struct properties
    enum CodingKeys: String, CodingKey {
        case attached
        case catalogId
        case categoryId
        case createdBy
        case createdAt = "created_at"
        case expireAt = "expire_at"
        case id
        case isActive
        case limit
        case productId
        case promocode
        case qty
        case titleEn
        case titleRu
        case titleUz
        case type
        case updatedBy
        case updatedAt = "updated_at"
        case userId
    }
}
