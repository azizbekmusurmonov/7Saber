//
//  UpdateModel.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 11/06/24.
//

import Foundation

struct UpdateModel: Codable {
    let id: Int
    let productId: Int
    let qty: Int
    let details: Details?
}

struct Details: Codable {
    let hex: String?
    let size: String
    let gender: String
}
