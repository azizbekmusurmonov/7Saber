//
//  OrderTypeModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 20/06/24.
//

import Foundation
import Core

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
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentPage = try container.decode(Int.self, forKey: .currentPage)
        self.data = try container.decode([String].self, forKey: .data)
        self.firstPageURL = try container.decode(String.self, forKey: .firstPageURL)
        self.from = try container.decodeIfPresent(String.self, forKey: .from)
        self.lastPage = try container.decode(Int.self, forKey: .lastPage)
        self.lastPageURL = try container.decode(String.self, forKey: .lastPageURL)
        self.links = try container.decode([Link].self, forKey: .links)
        self.nextPageURL = try container.decodeIfPresent(String.self, forKey: .nextPageURL)
        self.path = try container.decode(String.self, forKey: .path)
        self.perPage = try container.decode(Int.self, forKey: .perPage)
        self.prevPageURL = try container.decodeIfPresent(String.self, forKey: .prevPageURL)
        self.to = try container.decodeIfPresent(String.self, forKey: .to)
        self.total = try container.decode(Int.self, forKey: .total)
    }
}

struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}
