//
//  CategoriesModel.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 30/06/24.
//

import Foundation


// MARK: - Welcome
struct CategoriesModel: Codable {
    let id: Int
    let nameUz, nameRu, nameEn: String
    let queue: Int
    let isActive: Bool
    let createdAt, updatedAt, name: String
    let bg: Bg

    enum CodingKeys: String, CodingKey {
        case id, nameUz, nameRu, nameEn, queue, isActive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name, bg
    }
}

// MARK: - Bg
struct Bg: Codable {
    let id: Int
    let src: String
    let type: String
}
