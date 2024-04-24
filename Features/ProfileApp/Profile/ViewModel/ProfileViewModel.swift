//
//  ProfileView.swift
//  Profile
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Combine

public class ProfileViewModel: ObservableObject {
    public init() { }
    
    @Published var profileImage: ProfileBundle = ProfileBundle(
        profileImage: "Fon",
        profileName: "Azizbek Musurmpnov",
        gmailName: "azizbekmusurmonov004@gmail.com")
}
