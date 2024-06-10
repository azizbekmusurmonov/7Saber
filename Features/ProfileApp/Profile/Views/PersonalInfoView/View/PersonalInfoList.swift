//
//  PersonalInfoList.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 03/05/24.
//

import SwiftUI
import Core
import AssetKit

struct PersonalInfoList: View {
    
    @Environment(\.dismiss) var pop
    
    @State private var header = "Birthday"
    @State private var showPicker = false
    @State private var birthDate = Date()
    
    @EnvironmentObject var vm: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            FonImage(personalBundle: $vm.profileData)
            
            TextFieldView(header: "Full name",
                          titleKey: "Enter your full name",
                          text: "")
            .padding(.top, 20)
            
            TextFieldView(header: "Phone number",
                          titleKey: "Enter your phone number",
                          text: "")
            .keyboardType(.phonePad)
            
            TextFieldView(header: "E-mail",
                          titleKey: "Enter e-mail",
                          text: "")
            .keyboardType(.emailAddress)
            
            PersonSexDataView()
            
            HStack(spacing: 10) {
                VStack(alignment: .leading) {
                    Text(header)
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text(dateFormatter.string(from: birthDate))
                }
                Spacer()
                Button(action: {
                    showPicker.toggle()
                }) {
                    Image(uiImage: Asset.Image.Icons.calendar.image)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            
            Divider()
            
            HStack(spacing: 10) {
                
                SaveCancelButtons(title: "Cancel",
                                  color: Asset.Color.Button.grayCol.swiftUIColor,
                                  textColor: Asset.Color.Text.primaryCol.swiftUIColor,
                                  buttonPressed: {
                    pop()
                })
                
                SaveCancelButtons(title: "Save",
                                  color: Asset.Color.Button.blackCol.swiftUIColor, textColor: Asset.Color.Text.whiteCol.swiftUIColor,
                                  buttonPressed: {
                    print("Save profile")
                })
            }
            
        }
        .padding()
        .overlay {
            if showPicker {
                DatePicker(selection: $birthDate, displayedComponents: .date) {
                    Text("")
                }
                .frame(width: UIScreen.main.bounds.width - 40)
                .datePickerStyle(.wheel)
                .background(Asset.Color.Surface.Card.color.swiftUIColor)
                .cornerRadius(10)
            }
        }
        .onTapGesture {
            showPicker.toggle()
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

#Preview {
    PersonalInfoList()
}
