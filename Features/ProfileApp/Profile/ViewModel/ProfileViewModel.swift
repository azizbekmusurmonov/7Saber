//
//  ProfileView.swift
//  Profile
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Combine
import AssetKit

public class ProfileViewModel: ObservableObject {
    
    public init() { }
    
    @Published var profileImage: ProfileBundle = ProfileBundle(
        profileImage: Asset.Image.Logo.person.image,
        profileName: "Azizbek Musurmpnov",
        gmailName: "azizbekmusurmonov004@gmail.com",
        phoneNumber: "883825004")
}
