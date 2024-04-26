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
    
    @State var sections: [SectionModel] = [
        SectionModel(headertitle: "ACCOUNT",
                     cells: [
                        ProfilecellModel(title: "Personal information",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: PersonalInfoView()),
                        ProfilecellModel(title: "Addresses", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AddressView()),
                        ProfilecellModel(title: "Payment methods", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: PaymentMethodView())
                     ]),
        SectionModel(headertitle: "ORDERS",
                     cells: [
                        ProfilecellModel(title: "Current orders", 
                                         hasRightIcon: true,
                                         number: "3",
                                         pushToView: CurrentOrdersView()),
                        ProfilecellModel(title: "Order history", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: OrderHistoryView()),
                        
                     ]),
        SectionModel(headertitle: "SETTINGS",
                     cells: [
                        ProfilecellModel(title: "Push notifications",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: PushNotificationView()),
                        ProfilecellModel(title: "Privacy", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: PrivacyView()),
                        ProfilecellModel(title: "Language", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: LanguageView()),
                        ProfilecellModel(title: "Country / Region", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: CountryRegionView())
                     ]),
        SectionModel(headertitle: "HELP CENTER",
                     cells: [
                        ProfilecellModel(title: "Push notifications",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: PushNotificationView()),
                        ProfilecellModel(title: "Privacy", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: PrivacyView()),
                        ProfilecellModel(title: "Language", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: LanguageView()),
                        ProfilecellModel(title: "Country / Region", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: CountryRegionView())
                     ]),
        SectionModel(headertitle: "LEGAL",
                     cells: [
                        ProfilecellModel(title: "General Terms & Conditions",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: GeneralTermsView()),
                        ProfilecellModel(title: "Terms of Use", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: TermsUseView()),
                        ProfilecellModel(title: "Privacy Policy", 
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: PrivacyPolicyView())
                     ])
    ]
    
    public init() { }
    
    public var body: some View {
       
        NavigationView {
            VStack {
                
                navigationBar
                
                ScrollView {
                    VStack(spacing: .zero) {
                        
                        fonImageAndGmail
                        
                        profileList
                        
                        logOutButton
                        
                        deleteAccButton

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
    
    var profileList: some View {
        
        VStack(alignment: .leading) {
            
            ForEach(0..<sections.count, id: \.self) { index in
                Text(sections[index].headertitle)
                    .font(.largeTitle)
                    .bold()
                
                
                ForEach(0..<sections[index].cells.count) { cellIndex in
                    
                    NavigationLink {
//                        sections[index].cells[cellIndex].pushToView
                        AddressView()
                    } label: {
                        HStack {
                            
                            Text(sections[index].cells[cellIndex].title)
                                .font(.title2)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if sections[index].cells[cellIndex].hasRightIcon {
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 5.59, height: 12)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    Divider()
                }
            }
        }
        .padding()
    }
    
    var fonImageAndGmail: some View {
        
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
        
    }
    
    var logOutButton: some View {
        
        VStack(spacing: .zero) {
            Button(action: {
               print("log out")
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
        }
        
    }
    
    var deleteAccButton: some View {
        
        VStack(spacing: .zero) {
            Button(action: {
                print("delete acc")
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

#Preview {
    ProfileView()
}
