//
//  EnterPasswordView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 02/05/24.
//

import SwiftUI
import Core

struct EnterPasswordView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var body: some View {
        ZStack {
            VStack {
                
                NavigationBar(
                    showButton: vm.isCodeViewPresented,
                    leftButtonAction: {
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            vm.isCodeViewPresented.toggle()
                            vm.isLoading.toggle()
                        }
                    },
                    skipButtonAction: {
                        DataStorage.storage.save(true, for: .isRegistrate)
                    }
                )
                
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
                            vm.isLoading = true
                            vm.loginForEmail()
                            vm.isLoading = false
                        }
                    )
                    
                    if !vm.isLoading {
                        iOSSpinner()
                    }
                    
                    Spacer()
                }
            }
        }
        .hideKeyboardOnTap()
    }
}

#Preview {
    EnterPasswordView()
}
