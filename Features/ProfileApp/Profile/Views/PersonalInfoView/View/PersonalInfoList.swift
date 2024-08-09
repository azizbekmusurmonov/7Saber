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
    
    @State private var header = Localizations.birthday
    @State private var showPicker = false
    @State private var birthDate = Date()
    
    @EnvironmentObject var vm: PersonalInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            FonImage()
            
            TextFieldView(header: Localizations.fullName,
                          titleKey: "Enter your full name",
                          text: $vm.fullNam)
            .padding(.top, 20)
            
            TextFieldView(header: Localizations.phoneNumber,
                          titleKey: "Enter your phone number",
                          text: $vm.phoneNamber)
            .keyboardType(.phonePad)
            
            TextFieldView(header: Localizations.email,
                          titleKey: "Enter e-mail",
                          text: $vm.email)
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
            .onTapGesture {
                showPicker.toggle()
            }
            
            Divider()
            
            HStack(spacing: 10) {
                
                SaveCancelButtons(title: Localizations.cancel,
                                  color: Asset.Color.Button.grayCol.swiftUIColor,
                                  textColor: Asset.Color.Text.primaryCol.swiftUIColor,
                                  buttonPressed: {
                    pop()
                }, isDisabled: .constant(false))
                
                SaveCancelButtons(title: Localizations.save,
                                  color: Asset.Color.Button.blackCol.swiftUIColor, textColor: Asset.Color.Text.whiteCol.swiftUIColor,
                                  buttonPressed: {
                    vm.sendPersonalInfo(fullName: vm.fullNam, phone: vm.phoneNamber, email: vm.email, gender: vm.gender, avatar: vm.profileImage!)
                }, isDisabled: .constant(!vm.isFormValid))
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
            showPicker = false
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
