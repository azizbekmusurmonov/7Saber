//
//  AvpModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import Foundation

// MARK: - AVPplayer
struct AVPplayer: Codable, Identifiable {
    let id: Int
    let link, titleUz, titleRu, titleEn: String
    let descUz, descRu, descEn, details: String?
    let webMediaID, appMediaID: Int
    let catalogID: String?
    let type, queue: Int
    let isActive: Bool
    let createdAt, updatedAt, title: String
    let desc: String?
    let webMedia, appMedia: Media

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
struct Media: Codable {
    let id: Int?
    let src: String?
    let type: String?
}
