//
//  ProfileBundle.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 07/04/24.
//

import Foundation
import UIKit

struct ProfileModel: Codable {
    let user: ProfileBundle
    let token: String?
}

struct ProfileBundle: Codable {
    let id, roleID, avatarID: Int
    let fullName, email: String?
    let phone: String
    let gender, birthday: String?
    let device: [String?]?
    let isDeleted: Bool
    let createdAt, updatedAt: String
    let role: RoleModule
    let avatar: AvatarModule
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.roleID = try container.decode(Int.self, forKey: .roleID)
        self.avatarID = try container.decode(Int.self, forKey: .avatarID)
        self.fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.birthday = try container.decodeIfPresent(String.self, forKey: .birthday)
        self.device = try container.decodeIfPresent([String?].self, forKey: .device)
        self.isDeleted = try container.decode(Bool.self, forKey: .isDeleted)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.role = try container.decode(RoleModule.self, forKey: .role)
        self.avatar = try container.decode(AvatarModule.self, forKey: .avatar)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case roleID = "roleId"
        case avatarID = "avatarId"
        case fullName, email, phone, gender, birthday, device, isDeleted
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case role, avatar
    }
}

struct AvatarModule: Codable {
    let id: Int
    let baseName: String
    let src: String
    let type: String
}

struct RoleModule: Codable {
    let id: Int
    let name: String
    let permissions: [String?]
    let isActive: Bool
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, permissions, isActive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
