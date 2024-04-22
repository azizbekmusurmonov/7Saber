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
        
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "PROFILE",
                              leftImage: Asset.Image.Logo.logoBlack.image,
                              rightImage: Asset.Image.Navigation.cancelNav.image
            )
        }
        
        ScrollView {
            VStack(spacing: .zero) {
                HStack(spacing: .zero) {
                    Image("Fon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 146, height: 146)
                        .clipShape(Circle())
                        .padding()
                    
                    Divider()
                    Spacer()
                    
                    VStack(spacing: .zero) {
                        Text("Azizbek Musurmonov")
                            .font(.headline)
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                            .padding(2)
                        Text("azizbekmusurmonov004@gmail.com")
                            .font(.caption2)
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        
                            .padding(10)
                        Divider()
                        
                        Button(action: {
                            
                        }) {
                            Text("EDIT PROFILE")
                                .padding()
                                .font(.footnote)
                                
                            Image(uiImage: Asset.Image.Icons.edit.image)
                                
                        }
                        .frame(height: 40)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        .background(Asset.Color.Button.grayCol.swiftUIColor)
                        .cornerRadius(24)
                        .padding()
                        .padding(.leading, 12)
                    }
                }
                Spacer()
//                List {
                    ProfileTabHeader(title: "ACCOUNT")
                    ProfileTab(title: "Personal information")
                    ProfileTab(title: "Addresses")
                    ProfileTab(title: "Payment methods")
                    
                    ProfileTabHeader(title: "ORDERS")
                    ProfileTab(title: "Current orders")
                    ProfileTab(title: "Order history")
                    
                    ProfileTabHeader(title: "SETTINGS")
                    ProfileTab(title: "Push notifications")
                    ProfileTab(title: "Privacy")
                    ProfileTab(title: "Language")
                    ProfileTab(title: "Country / Region")
                    
                    ProfileTabHeader(title: "LEGAL")
                    ProfileTab(title: "General Terms & Conditions")
                    ProfileTab(title: "Terms of Use")
                    ProfileTab(title: "Privacy Policy")
//                }
//                .listStyle(PlainListStyle())
                
                Button(action: {
                    
                }) {
                    HStack(spacing: .zero) {
                        Text("LOG OUT")
                            .padding()
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        
                        Spacer()
                        
                        Spacer()
                        
                        Image(uiImage: Asset.Image.Profile.logOut.image)
                            .padding()
                    }
                }
                .background(Asset.Color.Button.grayCol.swiftUIColor)
                .frame(width: 313, height: 56)
                .cornerRadius(24)
                .padding(.top, 20)

                Button(action: {
                    
                }) {
                    HStack(spacing: .zero) {
                        Text("DELETE ACOUNT")
                            .padding()
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        
                        Spacer()
                        
                        Spacer()
                        
                        Image(uiImage: Asset.Image.Icons.trash2.image)
                            .padding()
                    }
                }
                .frame(width: 313, height: 56)
                .background(Asset.Color.Button.grayCol.swiftUIColor)
                .cornerRadius(24)

            }
        }
    }
}

#Preview {
    ProfileView()
}
