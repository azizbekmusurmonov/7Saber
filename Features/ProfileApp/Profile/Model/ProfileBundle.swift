//
//  ProfileBundle.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 07/04/24.
//

import SwiftUI

struct ProfileBundle: Identifiable, Hashable {
    var id = UUID().uuidString
    var profileImage: String
    var profileName: String
    var gmailName: String
}
