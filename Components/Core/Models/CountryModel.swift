//
//  CountryModel.swift
//  Core
//
//  Created by Ismatillokhon on 26/06/24.
//

import Foundation

public struct CountryModel: Codable, Identifiable {
    public let id: Int
    public let parentID: Int?
    public let nameUz, nameRu, nameEn, code: String
    public let queue: String?
    public let createdAt, updatedAt: String?
    public let name: String
//    let children: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parentId"
        case nameUz, nameRu, nameEn, code, queue
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
    }
}
