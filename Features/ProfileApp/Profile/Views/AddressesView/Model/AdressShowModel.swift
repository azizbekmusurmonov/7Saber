//
//  AdressShowModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 19/06/24.
//

import Foundation

struct AdressShowModel: Codable {
    let id: Int
    let name: String
    let userID, countryID: Int
    let street, building, appartment, floor: String
    let house, city, spr, zipcode: String
    let phone: String
    let email: String?
    let createdAt, updatedAt: String
    let country: Country

    enum CodingKeys: String, CodingKey {
        case id, name
        case userID = "userId"
        case countryID = "countryId"
        case street, building, appartment, floor, house, city, spr, zipcode, phone, email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case country
    }
}

struct Country: Codable {
    let id: Int
    let nameUz, nameRu, nameEn, code: String
    let name: String
    let children: [String]
}
