//
//  RegestrationModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 27/05/24.
//

import Foundation

struct RegestrationModel: Codable {
    let user: RegestrationUser?
    let token: String
}

struct RegestrationUser: Codable {
    let fullName: String?
    let email: String?
    let phone: String?
    let gender: String?
    let birthday: String?
    let created_at: String
    let updated_at: String
    let id: Int
}
