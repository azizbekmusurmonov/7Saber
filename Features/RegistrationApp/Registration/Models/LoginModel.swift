//
//  LoginModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 27/05/24.
//

import Foundation

struct LoginModel: Codable {
    let user: LoginUser?
    let token: String
}

struct LoginUser: Codable {
    let id: Int
    let roleId: Int
    let avatarId: Int
    let fullName: String?
    let email: String?
    let phone: String?
    let gender: String?
    let birthday: String?
    let isDeleted: Bool
    let created_at: String
    let updated_at: String
    let role: Role
    let avatar: Avatar
}
