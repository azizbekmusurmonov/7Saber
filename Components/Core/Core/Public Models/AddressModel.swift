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
    public let currentPage: Int?
    public let data: [AddressData]
    public let firstPageURL: String?
    public let from, lastPage: Int?
    public let lastPageURL: String?
    public let links: [LinkModel]
    public let nextPageURL: String?
    public let path: String?
    public let perPage: Int?
    public let prevPageURL: String?
    public let to, total: Int?

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
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentPage = try container.decode(Int.self, forKey: .currentPage)
        self.data = try container.decode([AddressData].self, forKey: .data)
        self.firstPageURL = try container.decode(String.self, forKey: .firstPageURL)
        self.from = try container.decode(Int.self, forKey: .from)
        self.lastPage = try container.decode(Int.self, forKey: .lastPage)
        self.lastPageURL = try container.decode(String.self, forKey: .lastPageURL)
        self.links = try container.decode([LinkModel].self, forKey: .links)
        self.nextPageURL = try container.decodeIfPresent(String.self, forKey: .nextPageURL)
        self.path = try container.decode(String.self, forKey: .path)
        self.perPage = try container.decode(Int.self, forKey: .perPage)
        self.prevPageURL = try container.decodeIfPresent(String.self, forKey: .prevPageURL)
        self.to = try container.decode(Int.self, forKey: .to)
        self.total = try container.decode(Int.self, forKey: .total)
    }
}

// MARK: - Datum
public struct AddressData: Codable {
    public let id: Int?
    public let name: String?
    public let userID, countryID: Int?
    public let street, building, appartment, floor: String?
    public let house, city, spr, zipcode: String?
    public let phone: String?
    public let email: String?
    public let country: CountryModel?

    public enum CodingKeys: String, CodingKey {
        case id, name
        case userID = "userId"
        case countryID = "countryId"
        case street, building, appartment, floor, house, city, spr, zipcode, phone, email
        case country
    }
}

// MARK: - Country
public struct CountryModel: Codable, Identifiable {
    public let id: Int
    public let parentID: Int?
    public let nameUz, nameRu, nameEn, code: String
    public let currencies: String?
    public let queue: String?
    public let name: String?
    
    public var safeName: String {
        name ?? ""
    }
//    let children: [JSONAny]
    
    public init(from decoder: any Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.id = try container?.decode(Int.self, forKey: .id) ?? .zero
        self.parentID = try container?.decodeIfPresent(Int.self, forKey: .parentID) ?? .zero
        self.nameUz = try container?.decode(String.self, forKey: .nameUz) ?? ""
        self.nameRu = try container?.decode(String.self, forKey: .nameRu) ?? ""
        self.nameEn = try container?.decode(String.self, forKey: .nameEn) ?? ""
        self.code = try container?.decode(String.self, forKey: .code) ?? ""
        self.currencies = try container?.decodeIfPresent(String.self, forKey: .currencies)
        self.queue = try container?.decodeIfPresent(String.self, forKey: .queue)
//        self.createdAt = try container?.decode(String.self, forKey: .createdAt) ?? ""
//        self.updatedAt = try container?.decode(String.self, forKey: .updatedAt) ?? ""
        self.name = try container?.decodeIfPresent(String.self, forKey: .name) ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parentId"
        case nameUz, nameRu, nameEn, code, currencies, queue
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
        case name // children
    }
}


// MARK: - Link
public struct LinkModel: Codable {
    public let url: String?
    public let label: String?
    public let active: Bool
}
