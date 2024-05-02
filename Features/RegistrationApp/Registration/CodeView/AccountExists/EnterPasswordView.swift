//
//  EnterPasswordView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 02/05/24.
//

import SwiftUI

struct EnterPasswordView: View {
    
    @StateObject var vm = RegisterMobillAppViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                WelcomeView(welcomeText: "Enter your password")
                    .padding(.top, 150)
                
                VStack(spacing: 20) {
                    
                    PrimeryTextField(
                        textFiledText: $vm.userPassword,
                        keyboardType: .constant(.emailAddress),
                        placeholderText: "Password",
                        imageIsHidden: true
                    )
                    .padding(.leading, 40)
                    
                    PrimeryButton(
                        buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
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
    EnterPasswordView()
}
