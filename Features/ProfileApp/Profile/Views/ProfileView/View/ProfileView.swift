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
    
    public init() { }
    
    public var body: some View {
        
        if vm.isLoading {
            VStack{}
//            LoaderView()
        } else {
            NavigationView {
                VStack {
                    
                    navigationBar
                    
                    ScrollView {
                        VStack(spacing: .zero) {
                            
                            ProfileImageView()
                                .environmentObject(vm)
                            
                            ProfileList()
                            DeleteAndLogOutButton(title: Localizations.logOut,
                                                  icon: Asset.Image.Profile.logOut.image,
                                                  buttonPressed: {
                                print("log out")
                            })
                            
                            DeleteAndLogOutButton(title: Localizations.deleteAccount,
                                                  icon: Asset.Image.Icons.trash2.image,
                                                  buttonPressed: {
                                print("delete acc")
                            })
                        }
                        .onChange(of: vm.message) { newValue in
                            guard let newValue else { return }
                            switch newValue {
                            case .succes(message: let message):
                                Snackbar.show(message: message, theme: .success)
                            case .error(message: let message):
                                Snackbar.show(message: message, theme: .error)
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

extension ProfileView {
    
    var navigationBar: some View {
        
        VStack(spacing: .zero) {
            BaseNavigationBar(title: Localizations.profile,
                              leftImage: Asset.Image.Logo.logoBlack.image,
                              rightImage: Asset.Image.Navigation.cancelNav.image
            )
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfileViewModel())
}
