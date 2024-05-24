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
    
    @State var sex = Date.now
    
    @EnvironmentObject var vm: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            TextFieldView(header: "Full name",
                          titleKey: "Enter your full name",
                          text: "")
            
            TextFieldView(header: "Phone number",
                          titleKey: "Enter your phone number",
                          text: "")
            .keyboardType(.phonePad)
            
            TextFieldView(header: "E-mail",
                          titleKey: "Enter e-mail",
                          text: "")
            .keyboardType(.emailAddress)
            
            PersonSexDataView()
            
            DatePickerView()
        }
        .padding()
    }
}

#Preview {
    PersonalInfoList()
}
