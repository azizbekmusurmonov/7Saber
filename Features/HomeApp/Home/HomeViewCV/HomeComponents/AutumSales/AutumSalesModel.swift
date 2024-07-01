//
//  AutumSalesModel.swift
//  Home
//
//  Created by islombek on 21/06/24.
//

import Foundation

// MARK: - AutumSales
struct AutumSales: Codable {
    let id: Int
    let link, titleUz, titleRu, titleEn: String
    let descUz, descRu, descEn: String
    let details: AutumSalesDetails
    let webMediaID, appMediaID: Int
    let catalogID: String?
    let type, queue: Int
    let isActive: Bool
    let createdAt, updatedAt, title, desc: String
    let webMedia, appMedia: AutumSalesMedia

    enum CodingKeys: String, CodingKey {
        case id, link, titleUz, titleRu, titleEn, descUz, descRu, descEn, details
        case webMediaID = "webMediaId"
        case appMediaID = "appMediaId"
        case catalogID = "catalogId"
        case type, queue, isActive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case title, desc
        case webMedia = "web_media"
        case appMedia = "app_media"
    }
}

// MARK: - Media
struct AutumSalesMedia: Codable {
    let id: Int
    let src: String
    let type: String
}

// MARK: - Details
struct AutumSalesDetails: Codable {
    let percent: Int
}

