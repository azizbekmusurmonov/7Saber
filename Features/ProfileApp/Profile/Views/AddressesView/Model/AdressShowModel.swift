//
//  AdressShowModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 19/06/24.
//

import Foundation

struct AddressShowModel: Codable {
    let currentPage: Int
    let data: [Datum]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [Linki]
    let nextPageURL: String?
    let path: String
    let perPage: Int
    let prevPageURL: String?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

struct Datum: Codable {
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
        case userID = "user_id"
        case countryID = "country_id"
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

struct Linki: Codable {
    let url: String?
    let label: String
    let active: Bool
}
