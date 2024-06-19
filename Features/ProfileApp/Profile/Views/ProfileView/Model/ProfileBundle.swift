//
//  ProfileBundle.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 07/04/24.
//

import Foundation
import UIKit

struct ProfileBundle: Hashable, Decodable {
    var profileImageURL: String
    var profileName: String
    var gmailName: String
    var phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case profileImageURL = "profileImage"
        case profileName
        case gmailName
        case phoneNumber
    }
}
