//
//  PersonalInfoModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 09/06/24.
//

import SwiftUI

struct PersonalInfoModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var profileImage: UIImage
    var profileName: String
    var phoneNumber: String
    var gmailName: String
    var gender: String
    var birth: String
}
