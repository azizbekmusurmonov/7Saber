//
//  OrderTypeModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 20/06/24.
//

import Foundation

struct OrderTypeModel: Codable {
    let currentPage: Int
    let data: [String]
    let firstPageURL: String
    let from: String?
    let lastPage: Int
    let lastPageURL: String
    let links: [Link]
    let nextPageURL: String?
    let path: String
    let perPage: Int
    let prevPageURL, to: String?
    let total: Int

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

struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}
