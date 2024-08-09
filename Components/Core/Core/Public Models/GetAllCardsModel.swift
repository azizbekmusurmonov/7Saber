//
//  GetAllCards.swift
//  Core
//
//  Created by Ismatillokhon on 09/08/24.
//

import Foundation

public struct GetAllCardsModel: Codable {
    public let currentPage: Int
    public let data: [String]
    public let firstPageURL: String
    public let from: String?
    public let lastPage: Int
    public let lastPageURL: String
    public let links: [CardLinkModel]
    public let nextPageURL: String?
    public let path: String
    public let perPage: Int
    public let prevPageURL, to: String?
    public let total: Int

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

public struct CardLinkModel: Codable {
    let url: String?
    let label: String
    let active: Bool?
}
