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
}
