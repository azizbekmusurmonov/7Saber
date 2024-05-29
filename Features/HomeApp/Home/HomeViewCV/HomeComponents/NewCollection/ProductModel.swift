//
//  ProductModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import Foundation

// MARK: - ProductElement
struct ProductModel: Codable, Identifiable {
    let id: Int
    let billzID: String
    let parentID, nameUz: String??
    let nameRu: String
    let nameEn: String??
    let bgID: Int
    let queue: String??
    let isActive, isBillz, isDeleted: Bool
    let createdAt, updatedAt: String
    let name: String??
    let bg: Background

    enum CodingKeys: String, CodingKey {
        case id
        case billzID = "billzId"
        case parentID = "parentId"
        case nameUz, nameRu, nameEn
        case bgID = "bgId"
        case queue, isActive, isBillz, isDeleted
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name, bg
    }
}

// MARK: - Bg
struct Background: Codable {
    let id: Int
    let baseName, originName: String??
    let src: String
    let size: String??
    let type: String
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, baseName, originName, src, size, type
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
