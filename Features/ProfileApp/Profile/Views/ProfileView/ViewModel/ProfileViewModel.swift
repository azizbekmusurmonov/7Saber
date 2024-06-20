//
//  ProfileView.swift
//  Profile
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Combine
import AssetKit
import NetworkManager

public class ProfileViewModel: ObservableObject {
    
    @Published var profileData: ProfileBundle = ProfileBundle(
        profileImageURL: "",
        profileName: "",
        gmailName: "",
        phoneNumber: "")
    
    public init() { }
    
    public func fetchProfile() async {
        do {
            let profile: ProfileBundle = try await NetworkService.shared.request(
                url: "https://lab.7saber.uz/api/client/user/show/1",
                decode: ProfileBundle.self,
                method: .get)
            
            profileData = profile // Update entire profileData with fetched profile
        } catch {
            print("Failed to fetch profile:", error)
            // Handle error appropriately, maybe show an alert to the user
        }
    }
}
