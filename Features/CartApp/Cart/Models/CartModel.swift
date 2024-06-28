//
//  CartModel.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 11/06/24.
//

import Foundation

// MARK: - Welcome
struct CartModel: Codable {
    let id = UUID().uuidString
    let currentPage: Int
    let data: [Cart]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [CartLinkModel]
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

// MARK: - Datum
struct Cart: Codable {
    let id, userID, productID: Int
    var qty: Int
    let details: CartDetails
    let type: Int
    let createdAt, updatedAt: String
    let product: ProductModel

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case productID = "productId"
        case qty, details, type
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case product
    }
}

// MARK: - Details
struct CartDetails: Codable {
    let colorID: Int
    let size: String

    enum CodingKeys: String, CodingKey {
        case colorID = "colorId"
        case size
    }
}

// MARK: - Product
struct ProductModel: Codable {
    let id, catalogID, categoryID: Int
    let sportTypeID: Int?
    let nameUz, nameRu, nameEn: String
    let descUz, descRu, descEn, specUz: String?
    let specRu, specEn: String?
    let sku: String
    let discount: [String?]
    let price: [String: Int?]
    let gender: String
    let mainImgID: Int
    let mediaID: String?
    let clientMediaIDS: String
    let weight, type: Int
    let isActive: Bool
    let additions: [String?]
    let createdAt, updatedAt, name: String
    let desc: String?
    let attributes: [CartAttribute]
    let mainImg: MainImgModel
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
struct CartAttribute: Codable {
    let productID: Int
    let billzID: String
    let barcode, colorID: Int
    let size: String
    let photos: [String?]
    let qty: Int
    let createdAt, updatedAt: String
    let color: CartColor

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
struct CartColor: Codable {
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

// MARK: - MainImg
struct MainImgModel: Codable {
    let id: Int
    let src: String
    let type: String
}

// MARK: - Link
struct CartLinkModel: Codable {
    let url: String?
    let label: String
    let active: Bool
}

