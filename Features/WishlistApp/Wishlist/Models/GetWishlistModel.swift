//
//  GetWishlistModel.swift
//  Wishlist
//
//  Created by Asadbek Yoldoshev on 08/08/24.
//

import Foundation

// MARK: - WelcomeElement
struct GetWishlistModel: Codable, Identifiable {
    let id, qty: Int?
    let product: Product?
}

struct Product: Codable {
    let id: Int?
    let name: String?
    let price: Price?
    let discount: Discount?
    let gender: Gender?
    let mainImg: MainImg?
    let media: String?
    let attribute: [WishlistAttribute?]

    enum CodingKeys: String, CodingKey {
        case id, name, price, discount, gender
        case mainImg = "main_img"
        case media, attribute
    }
}

// MARK: - Attribute
struct WishlistAttribute: Codable {
    let productID: Int?
    let billzID: String?
    let barcode, colorID: Int?
    let size: String?
    let photos: [Photo?]
    let qty: Int?
    let createdAt, updatedAt: String?
    let color: WishlistColor?

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
struct WishlistColor: Codable {
    let id: Int?
    let billzID, nameUz, nameRu, nameEn: String?
    let hex: Hex?
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

enum Hex: String, Codable {
    case aa7941 = "#aa7941"
    case the003B5E = "#003b5e"
    case the6366F1 = "#6366f1"
}

// MARK: - Photo
struct Photo: Codable {
    let baseName: String?
    let src: String?
}

// MARK: - Discount
struct Discount: Codable {
    let amount: Amount?
    let type: String?
    let productPrice, discountPrice: Amount?
}

enum Amount: Codable {
    case integer(Int?)
    case price(Price?)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(Price.self) {
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

// MARK: - Price
struct Price: Codable {
    let value: Int?
    let currency: Currency?
}

enum Currency: String, Codable {
    case uzs = "UZS"
}

enum Gender: String, Codable {
    case men = "MEN"
    case nA = "N/A"
    case unisex = "UNISEX"
}

// MARK: - MainImg
struct MainImg: Codable {
    let id: Int?
    let src: String?
    let type: TypeEnum?
}

enum TypeEnum: String, Codable {
    case jpg = "jpg"
}

typealias Welcome = [GetWishlistModel]


