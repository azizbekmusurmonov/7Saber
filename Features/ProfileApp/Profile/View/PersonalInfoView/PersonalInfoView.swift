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
    @State var image = UIImage()
    @State var sex = Date.now
    @State var birthday = "MARCH 14, 2004"
    
    @State var showPicker = false
    
    @EnvironmentObject var vm: ProfileViewModel
    
    
    var profileBundle: ProfileBundle {
        return ProfileBundle(profileImage: image,
                                 profileName: fullName,
                                 gmailName: email)
        }
    
    @Environment(\.dismiss) var pop
    
    public init() { }
    
    var body: some View {
        VStack(spacing: .zero) {
            
            navBar
            
            ScrollView {
                VStack(spacing: .zero) {
                    
                    FonImage(personalBundle: .constant(profileBundle))
                    
                    personInfoList
                    
                    HStack(spacing: .zero) {
                        Button(action: {
                            pop()
                        }) {
                            Text("Cancel")
                                .padding()
                                .frame(width: 180)
                                .font(.footnote)
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        .background(Asset.Color.Button.grayCol.swiftUIColor)
                        .clipShape(.capsule)
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
                        .clipShape(.capsule)
                        .padding(.trailing)
                        .padding(.leading)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension PersonalInfoView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "PERSONAL INFORMATION", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed:  {
                print("leftButtonPressed")
                pop()
            })
        }
    }
    
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
            HStack(spacing: .zero) {
                Spacer()
                Button(action: {
                    
                }) {
                    Image(uiImage: Asset.Image.Icons.chevronDown.image)
                        .resizable()
                        .frame(width: 10, height: 4.65)
                }
            }
            Divider()
            
            Text("Birthday")
                .font(.caption)
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            HStack(spacing: .zero) {
                TextField("Enter your birthday", text: $birthday)
                
                Button(action: {
                    showPicker.toggle()
                }) {
                    Image(uiImage: Asset.Image.Icons.calendar.image)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            
            Divider()
        }
        .overlay(alignment: .center, content: {
            DatePicker("e", selection: $sex)
                .datePickerStyle(.compact)
                .frame(maxHeight: .infinity, alignment: .center)
                .opacity(showPicker ? 1 : 0)
                
        })
        .padding()
    }
}

#Preview {
    PersonalInfoView()
}
