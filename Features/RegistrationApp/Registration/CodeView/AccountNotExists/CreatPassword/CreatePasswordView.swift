//
//  CreatePasswordView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 01/05/24.
//

import SwiftUI

struct CreatePasswordView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var body: some View {
        ZStack {
            VStack {
                
                WelcomeView(welcomeText: "Create a password")
                    .padding(.top, 150)
                
                VStack(spacing: 20) {
                    
                    PrimeryTextField(
                        textFiledText: $vm.userPassword,
                        keyboardType: .constant(.emailAddress),
                        placeholderText: "Password",
                        imageIsHidden: true
                    )
                    .padding(.leading, 40)
                    
                    PrimeryTextField(
                        textFiledText: $vm.userRetryPassword,
                        keyboardType: .constant(.emailAddress),
                        placeholderText: "Re-type password",
                        imageIsHidden: true
                    )
                    .padding(.leading, 40)
                    
                    PrimeryButton(
                        buttonBacround: vm.userPassword.isEmpty || vm.userRetryPassword.isEmpty ? .constant(.gray) : .constant(.black),
                        buttonText: "ENTER",
                        action: {
                            
                        }
                    )
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    CreatePasswordView()
}
