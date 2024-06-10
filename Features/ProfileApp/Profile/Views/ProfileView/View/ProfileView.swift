//
//  ProfileViewModel.swift
//  Profile
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Core
import AssetKit

public struct ProfileView: View {
    
    @EnvironmentObject var vm: ProfileViewModel
    @StateObject var profileData = ProfileViewModel()
    
    public init() { }
    
    public var body: some View {
        
        NavigationView {
            VStack {
                
                navigationBar
                
                ScrollView {
                    VStack(spacing: .zero) {
                        
                        ProfileImageView(bundle: $vm.profileData)
                        
                        ProfileList()
                        
                        DeleteAndLogOutButton(title: "LOG OUT", 
                                              icon: Asset.Image.Profile.logOut.image,
                                              buttonPressed: {
                            print("log out")
                        })
                        
                        DeleteAndLogOutButton(title: "DELETE ACOUNT",
                                              icon: Asset.Image.Icons.trash2.image,
                                              buttonPressed: {
                            print("delete acc")
                        })
                    }
                }
            }
        }
    }
}

extension ProfileView {
    
    var navigationBar: some View {
        
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "PROFILE",
                              leftImage: Asset.Image.Logo.logoBlack.image,
                              rightImage: Asset.Image.Navigation.cancelNav.image
            )
        }
    }
}

#Preview {
    ProfileView()
}
