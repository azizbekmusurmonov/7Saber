//
//  MODELLL.swift
//  Home
//
//  Created by islombek on 24/05/24.
//

import Foundation
import Core

// MARK: - Shoes
struct Shoes: Codable {
    let currentPage: Int
    let data: [ShoesDatum]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [ShoesLink]
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
}

// MARK: - Datum
struct ShoesDatum: Codable, Identifiable {
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
//    let clientMediaIDS: ShoesClientMediaIDS
    let weight, type: Int
    let isActive: Bool
    let additions: [String]
    let createdAt, updatedAt, name: String
    let desc: String?
    let attributes: [ShoesAttribute]
    let mainImg: ShoesMainImg
    let media: String?

    enum CodingKeys: String, CodingKey {
        case id
        case catalogID = "catalogId"
        case categoryID = "categoryId"
        case sportTypeID = "sportTypeId"
        case nameUz, nameRu, nameEn, descUz, descRu, descEn, specUz, specRu, specEn, sku, discount, price, gender
        case mainImgID = "mainImgId"
        case mediaID = "mediaId"
//        case clientMediaIDS = "clientMediaIds"
        case weight, type, isActive, additions
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name, desc, attributes
        case mainImg = "main_img"
        case media
    }
}

// MARK: - Attribute
struct ShoesAttribute: Codable {
    let productID: Int
    let billzID: String
    let barcode, colorID: Int
    let size: String
    let photos: ApiPhotos
    let qty: Int
    let createdAt, updatedAt: String
    let color: ShoesColor

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
struct ShoesColor: Codable {
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
struct ShoesMainImg: Codable {
    let id: Int
    let src: String
    let type: ShoesTypeEnum
}

enum ShoesTypeEnum: String, Codable {
    case typeDefault = "default"
}

// MARK: - Link
struct ShoesLink: Codable {
    let url: String?
    let label: String
    let active: Bool
}
