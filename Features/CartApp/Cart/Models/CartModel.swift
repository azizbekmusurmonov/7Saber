//
//  CartModel.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 11/06/24.
//

import Foundation

struct CartModel: Codable {
    let current_page: Int
    let data: [String]
    let first_page_url: String
    let from: String?
    let last_page: Int
    let last_page_url: String
    let links: [Link?]
    let next_page_url: String?
    let path: String
    let per_page: Int
    let prev_page_url: String?
    let to: String?
    let total: Int
}

struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}
