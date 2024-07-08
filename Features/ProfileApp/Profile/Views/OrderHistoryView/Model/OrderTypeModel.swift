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

class JSONAny: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let boolValue = try? container.decode(Bool.self) {
            value = boolValue
            return
        }
        
        if let intValue = try? container.decode(Int.self) {
            value = intValue
            return
        }
        
        if let doubleValue = try? container.decode(Double.self) {
            value = doubleValue
            return
        }
        
        if let stringValue = try? container.decode(String.self) {
            value = stringValue
            return
        }
        
        if let arrayValue = try? container.decode([JSONAny].self) {
            value = arrayValue
            return
        }
        
        if let dictionaryValue = try? container.decode([String: JSONAny].self) {
            value = dictionaryValue
            return
        }
        
        throw JSONAny.decodingError(forCodingPath: decoder.codingPath)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let boolValue = value as? Bool {
            try container.encode(boolValue)
            return
        }
        
        if let intValue = value as? Int {
            try container.encode(intValue)
            return
        }
        
        if let doubleValue = value as? Double {
            try container.encode(doubleValue)
            return
        }
        
        if let stringValue = value as? String {
            try container.encode(stringValue)
            return
        }
        
        if let arrayValue = value as? [JSONAny] {
            try container.encode(arrayValue)
            return
        }
        
        if let dictionaryValue = value as? [String: JSONAny] {
            try container.encode(dictionaryValue)
            return
        }
        
        throw JSONAny.encodingError(forValue: value, codingPath: encoder.codingPath)
    }
}
