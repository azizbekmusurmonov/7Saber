//
//  AddressModel.swift
//  Core
//
//  Created by Ismatillokhon on 02/07/24.
//

import Foundation

// json to model

// MARK: - Adress
public struct AddressModel: Codable {
    public let currentPage: Int
    public let data: [AddressData]
    public let firstPageURL: String
    public let from, lastPage: Int
    public let lastPageURL: String
    public let links: [LinkModel]
    public let nextPageURL: String?
    public let path: String
    public let perPage: Int
    public let prevPageURL: String?
    public let to, total: Int

    public enum CodingKeys: String, CodingKey {
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

// MARK: - Datum
public struct AddressData: Codable {
    public let id: Int
    public let name: String
    public let userID, countryID: Int
    public let street, building, appartment, floor: String
    public let house, city, spr, zipcode: String
    public let phone: String
    public let email: String?
    public let createdAt, updatedAt: String
    public let country: CountryModel

    public enum CodingKeys: String, CodingKey {
        case id, name
        case userID = "userId"
        case countryID = "countryId"
        case street, building, appartment, floor, house, city, spr, zipcode, phone, email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case country
    }
}

// MARK: - Country
public struct CountryModel: Codable {
    public let id: Int
    public let nameUz, nameRu, nameEn, code: String
    public let name: String
//    public let children: [JSONAny]
}

// MARK: - Link
public struct LinkModel: Codable {
    public let url: String?
    public let label: String
    public let active: Bool
}
