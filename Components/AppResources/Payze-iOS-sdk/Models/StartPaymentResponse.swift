//
//  PostCardResponse.swift
//  PaySms
//
//  Created by Irakli Shelia on 04.12.21.
//

import Foundation

public struct StartPaymentResponse: Codable {
   public let success: Bool
   public let url: String?
   public let threeDSIsPresent: Bool
   
    public enum CodingKeys: String, CodingKey {
        case success = "success"
        case url = "url"
        case threeDSIsPresent = "threeDSIsPresent"
    }
}
