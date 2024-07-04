//
//  NewCollectionModel.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 30/06/24.
//

import Foundation

// MARK: - NewCollection
struct NewCollectionModel: Codable {
    let currentPage: Int
    let data: [NewCollectionDatum]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [NewCollectionLink?]
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

// MARK: - Welcome
struct NewCollectionDatum: Codable {
    let id: Int?
    let catalogID: Int?
    let categoryID: Int?
    let sportTypeID: String?
    let nameUz, nameRu, nameEn: String?
    let descUz: String?
    let descRu: String?
    let descEn, specUz, specRu, specEn: String?
    let sku: String?
    let discount: NewCollectionDiscount?
    let price: NewCollectionPrice?
    let gender: String?
    let mainImgID: Int?
    let mediaID: Int?
    let clientMediaIDS: [String?]
    let weight, type: Int?
    let isActive: Bool?
    let additions: [String?]
    let createdAt, updatedAt, name: String?
    let desc: String?
    let photos: [NewCollectionPhoto?]
    let attributes: [NewCollectionAttribute?]
    let mainImg: NewCollectionMainImg?
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
        case name, desc, photos, attributes
        case mainImg = "main_img"
        case media
    }
}

//MARK: - Discount

struct NewCollectionDiscount: Codable {
    let amount: NewCollectionAmount?
    let type: String?
    let productPrice, discountPrice: NewCollectionAmount?
}

enum DiscountUnion: Codable {
    case anythingArray([String?])
    case discountClass(NewCollectionDiscount)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(NewCollectionDiscount.self) {
            self = .discountClass(x)
            return
        }
        throw DecodingError.typeMismatch(DiscountUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DiscountUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .discountClass(let x):
            try container.encode(x)
        }
    }
}

enum Amount: Codable {
    case integer(Int)
    case price(NewCollectionPrice)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(NewCollectionPrice.self) {
            self = .price(x)
            return
        }
        throw DecodingError.typeMismatch(Amount.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Amount"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .price(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Amount
struct NewCollectionAmount: Codable {
    let value: Int?
    let currency: String?
}

// MARK: - Attribute
struct NewCollectionAttribute: Codable {
    let productID: Int?
    let billzID: String?
    let barcode, colorID: Int?
    let size: String?
    let photos: [NewCollectionPhoto?]
    let qty: Int?
    let createdAt, updatedAt: String?
    let color: NewCollectionColor?

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
    let id: Int?
    let billzID, nameUz, nameRu, nameEn: String?
    let hex: String?
    let createdAt, updatedAt, name: String?

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
    let baseName: String?
    let src: String?
}

// MARK: - MainImg
struct NewCollectionMainImg: Codable {
    let id: Int?
    let src: String?
    let type: String?
}

// MARK: - Price
struct NewCollectionPrice: Codable {
    let value: Int?
    let currency: String?
}

enum NewCollectionClientMediaIDS: String, Codable {
    case empty = "[]"
}

// MARK: - Link
struct NewCollectionLink: Codable {
    let url: String?
    let label: String?
    let active: Bool?
}
