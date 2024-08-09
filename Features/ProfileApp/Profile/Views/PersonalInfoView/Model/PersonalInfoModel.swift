//
//  PersonalInfoModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 09/06/24.
//

import SwiftUI
import Foundation

//struct Welcome: Decodable {
////    let profileImage: UIImage
//    var profileName: String
//    var phoneNumber: String
//    var gmailName: String
//    var gender: String
//    var birth: String
//}

// MARK: - Welcome
struct PersonalInfoModel: Codable {
    let user: User?
    let token: String?
}

// MARK: - User
struct User: Codable {
    let id, roleID, avatarID: Int?
    let fullName, email: String?
    let phone: String?
    let gender, birthday: String?
    let device: [String?]
    let isDeleted: Bool?
    let createdAt, updatedAt: String?
    let role: UserRole?
    let avatar: UserAvatar?

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
struct UserAvatar: Codable {
    let id: Int?
    let baseName: String?
    let src: String?
    let type: String?
}

// MARK: - Role
struct UserRole: Codable {
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
