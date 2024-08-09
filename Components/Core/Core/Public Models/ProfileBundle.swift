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
    public let user: UserProfileModel
    public let token: String
}

// MARK: - User
public struct UserProfileModel: Codable {
    public let id, roleID, avatarID: Int
    public let fullName: String
    public let email: String?
    public let phone, gender, birthday: String
    // public let device: [JSONAny]
    public let isDeleted: Bool
    public let createdAt, updatedAt: String
    public let role: RoleModule
    public let avatar: AvatarModule

    enum CodingKeys: String, CodingKey {
        case id
        case roleID = "roleId"
        case avatarID = "avatarId"
        case fullName, email, phone, gender, birthday, isDeleted
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case avatar, role
    }
}
public struct AvatarModule: Codable {
    public let id: Int
    public let baseName: String
    public let src: String?
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
