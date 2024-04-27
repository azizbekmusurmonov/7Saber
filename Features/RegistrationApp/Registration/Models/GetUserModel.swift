//
//  GetUserModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 28/04/24.
//

import Foundation

struct GetUserModel: Codable {
    let id: Int
    let roleId: Int
    let avatarId: Int
    let fullName: String
    let email: String
    let phone: String
    let gender: String
    let birthday: String
    let isDeleted: Bool
    let created_at: String
    let updated_at: String
    let role: Role
    let avatar: Avatar
}

struct Role: Codable {
    let id: Int
    let name: String
    let permissions: [String] 
    let isActive: Bool
    let created_at: String
    let updated_at: String
}

struct Avatar: Codable {
    let id: Int
    let src: String
}
