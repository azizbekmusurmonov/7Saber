//
//  UserModel.swift
//  Core
//
//  Created by Ismatillokhon on 5/13/24.
//

import Foundation

// MARK: - Public Models
public struct UserModel: Codable {
    public var id: Int
    public var avatarId: Int
    public var avatar: UserAvatar
    public var birthday: String?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.avatarId = try container.decode(Int.self, forKey: .avatarId)
        self.avatar = try container.decode(UserAvatar.self, forKey: .avatar)
        self.birthday = try container.decodeIfPresent(String.self, forKey: .birthday)
    }
}

public struct UserAvatar: Codable {
    public let id: Int
    public let src: String
}

//public struct UserAvatar: Codable {
//    public let id: Int
//    public let created_at: String?
//    public let email: String?
//    public let fullName: String
//    public let gender: String?
//    public let isDeleted: Bool
//    public let phone: String
//    public let role: String?
//    public let roleId: Int?
//    public let updated_at: String
//}

