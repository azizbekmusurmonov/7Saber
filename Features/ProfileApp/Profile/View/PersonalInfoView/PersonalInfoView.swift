//
//  PersonalInfoView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import Core
import AssetKit

struct PersonalInfoView: View {
    
    
    @State var fullName = "Azizbek Musurmonov"
    @State var phoneNumber = "+998"
    @State var email = "azizbekmusurmonov004@gmail.com"
    @State var sex = "Male"
    @State var birthday = "MARCH 14, 2004"
    
    @State var showImagePicker: Bool = false
    @State var profileImage = UIImage(named: "Fon")
    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "PERSONAL INFORMATION", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed:  {
                print("leftButtonPressed")
                pop()
            })
            .padding()
            Spacer()
            
            ScrollView {
                VStack(spacing: .zero) {
                    HStack(spacing: .zero) {
                        Image(uiImage: profileImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 146, height: 146)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .fill(.black.opacity(0.5))
                            }
                            .overlay(
                                Button(action: {
                                    showImagePicker.toggle()
                                }) {
                                    Image(uiImage: Asset.Image.Icons.plusCrcleWhite.image)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                }
                            )
                            .padding()
                            .sheet(isPresented: $showImagePicker) {
                                ImagePicker(sourceType: .photoLibrary) { image in
                                    self.profileImage = image
                                }
                            }
                        Spacer()
                    }
                    
                    personInfoList
                    
                    HStack(spacing: .zero) {
                        Button(action: {
                            
                        }) {
                            Text("Cancel")
                                .padding()
                                .frame(width: 200)
                                .font(.footnote)
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        .background(Asset.Color.Button.grayCol.swiftUIColor)
                        .frame(width: 180, height: 56)
                        .cornerRadius(24)
                        .padding(.leading)
                        
                        Button(action: {
                            
                        }) {
                            Text("Save")
                                .padding()
                                .frame(width: 180)
                                .font(.footnote)
                                .foregroundColor(Asset.Color.Text.whiteCol.swiftUIColor)
                        }
                        
                        .background(Asset.Color.Button.blackCol.swiftUIColor)
                        .cornerRadius(24)
                        .padding(.leading)
                    }
                   
                    .padding()
                }
                .padding()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

extension PersonalInfoView {
    
    
    var personInfoList: some View {
        VStack(alignment: .leading) {
            Text("Full name")
                .font(.caption)
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            TextField("Enter your full name", text: $fullName)
                
            Divider()
            
            Text("Phone number")
                .font(.caption)
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            TextField("Enter your phone number", text: $phoneNumber)
                .keyboardType(.numberPad)
            Divider()
            
            Text("E-mail")
                .font(.caption)
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            TextField("Enter your e-mail", text: $email)
                .keyboardType(.emailAddress)
            Divider()
            
            Text("Sex")
                .font(.caption)
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            TextField("", text: $sex)
                .keyboardType(.default)
            Divider()
            
            Text("Birthday")
                .font(.caption)
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            TextField("Enter your birthday", text: $birthday)
            Divider()
        }
        .padding()
    }
}

#Preview {
    PersonalInfoView()
}
