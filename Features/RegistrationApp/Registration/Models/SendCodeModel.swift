//
//  SendCodeModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 23/04/24.
//

import Foundation

struct SendCodeModel: Codable {
    let user: GetUserModel?
    let message: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.user = try container.decodeIfPresent(GetUserModel.self, forKey: .user)
        self.message = try container.decode(String.self, forKey: .message)
    }
}
