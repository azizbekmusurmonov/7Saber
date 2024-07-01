//
//  ProfileBundle.swift
//  Core
//
//  Created by Ismatillokhon on 01/07/24.
//

import Foundation


public struct ProfileModel: Codable {
    public let user: ProfileBundle
    public let token: String?
}

public struct ProfileBundle: Codable {
    public let id, roleID, avatarID: Int
    public let fullName, email: String?
    public let phone: String
    public let gender, birthday: String?
    public let device: [String?]?
    public let isDeleted: Bool
    public let createdAt, updatedAt: String
    public let role: RoleModule
    public let avatar: AvatarModule

    
    public init(from decoder: any Decoder) throws {
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

public struct AvatarModule: Codable {
    public let id: Int
    public let baseName: String
    public let src: String
    public let type: String
    
    public init(id: Int, baseName: String, src: String, type: String) {
        self.id = id
        self.baseName = baseName
        self.src = src
        self.type = type
    }
}

public struct RoleModule: Codable {
    public let id: Int
    public let name: String
    public let permissions: [String?]
    public let isActive: Bool
    public let createdAt, updatedAt: String
    
    public init(id: Int, name: String, permissions: [String?], isActive: Bool, createdAt: String, updatedAt: String) {
        self.id = id
        self.name = name
        self.permissions = permissions
        self.isActive = isActive
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    enum CodingKeys: String, CodingKey {
        case id, name, permissions, isActive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
