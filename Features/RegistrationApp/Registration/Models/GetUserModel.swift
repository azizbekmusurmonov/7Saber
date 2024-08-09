//
//  GetUserModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 28/04/24.
//

import Foundation

public struct GetUserModel: Codable {
    let id, roleID, avatarID: Int?
    public let fullName, email, phone, gender: String?
    let birthday: String?
    let device: [String?]
    let isDeleted: Bool?
    let createdAt, updatedAt: String?
    let role: Role?
    let avatar: Avatar?

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

// MARK: - Avatar
struct Avatar: Codable {
    let id: Int?
    let baseName: String?
    let src: String?
    let type: String?
}

// MARK: - Role
struct Role: Codable {
    let id: Int?
    let name: String?
    let permissions: [String?]
    let isActive: Bool?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, permissions, isActive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
