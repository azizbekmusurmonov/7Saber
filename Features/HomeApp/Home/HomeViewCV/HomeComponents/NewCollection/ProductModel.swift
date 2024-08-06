//
//  ProductModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import Foundation
import Core

// MARK: - NewCollection
struct NewCollection: Codable {
    let currentPage: Int
    let data: [NewCollectionDatum]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [NewCollectionLink]
    let nextPageURL, path: String
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
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentPage = try container.decode(Int.self, forKey: .currentPage)
        self.data = try container.decode([NewCollectionDatum].self, forKey: .data)
        self.firstPageURL = try container.decode(String.self, forKey: .firstPageURL)
        self.from = try container.decode(Int.self, forKey: .from)
        self.lastPage = try container.decode(Int.self, forKey: .lastPage)
        self.lastPageURL = try container.decode(String.self, forKey: .lastPageURL)
        self.links = try container.decode([NewCollectionLink].self, forKey: .links)
        self.nextPageURL = try container.decode(String.self, forKey: .nextPageURL)
        self.path = try container.decode(String.self, forKey: .path)
        self.perPage = try container.decode(Int.self, forKey: .perPage)
        self.prevPageURL = try container.decodeIfPresent(String.self, forKey: .prevPageURL)
        self.to = try container.decode(Int.self, forKey: .to)
        self.total = try container.decode(Int.self, forKey: .total)
    }
}

// MARK: - Datum
struct NewCollectionDatum: Codable, Identifiable {
    let id: Int
    let catalogID: Int?
    let categoryID: Int
    let sportTypeID: String?
    let nameUz, nameRu, nameEn: String
    let descUz, descRu, descEn, specUz: String?
    let specRu, specEn: String?
    let sku: String
    let discount: DiscountModel?
    let price: ApiPrice
    let gender: String
    let mainImgID: Int
    let mediaID: String?
    let clientMediaIDS: NewCollectionClientMediaIDS
    let weight, type: Int
    let isActive: Bool
    let additions: [String]
    let createdAt, updatedAt, name: String
    let desc: String?
    let attributes: [NewCollectionAttribute]
    let mainImg: NewCollectionMainImg
    let media: String?

    enum CodingKeys: String, CodingKey {
        case id
        case catalogID = "catalogId"
        case categoryID = "categoryId"
        case sportTypeID = "sportTypeId"
        case nameUz, nameRu, nameEn, descUz, descRu, descEn, specUz, specRu, specEn, sku, discount, price, gender
        case mainImgID = "mainImgId"
        case mediaID = "mediaId"
        case clientMediaIDS = "clientMediaIds"
        case weight, type, isActive, additions
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name, desc, attributes
        case mainImg = "main_img"
        case media
    }
}

// MARK: - Attribute
struct NewCollectionAttribute: Codable {
    let productID: Int
    let billzID: String
    let barcode, colorID: Int
    let size: String
    let photos: [NewCollectionPhoto]
    let qty: Int
    let createdAt, updatedAt: String
    let color: NewCollectionColor

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case billzID = "billzId"
        case barcode
        case colorID = "colorId"
        case size, photos, qty
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case color
    }
}

// MARK: - Color
struct NewCollectionColor: Codable {
    let id: Int
    let billzID, nameUz, nameRu, nameEn: String
    let hex: String?
    let createdAt, updatedAt, name: String

    enum CodingKeys: String, CodingKey {
        case id
        case billzID = "billzId"
        case nameUz, nameRu, nameEn, hex
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
    }
}

// MARK: - Photo
struct NewCollectionPhoto: Codable {
    let baseName: String
    let src: String
}

enum NewCollectionClientMediaIDS: String, Codable {
    case empty = "[]"
}

// MARK: - MainImg
struct NewCollectionMainImg: Codable {
    let id: Int
    let src: String
    let type: NewCollectionTypeEnum
}

enum NewCollectionTypeEnum: String, Codable {
    case typeDefault = "default"
}

// MARK: - Link
struct NewCollectionLink: Codable {
    let url: String?
    let label: String
    let active: Bool
}
