//
//  EnterPasswordView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 02/05/24.
//

import SwiftUI
import Core
import AssetKit

struct EnterPasswordView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let enterPassword: String
    let password: String
    let enter: String
    
    init(enterPassword: String = Localizations.enterPassword, password: String = Localizations.password, enter: String = Localizations.enter) {
        self.enterPassword = enterPassword
        self.password = password
        self.enter = enter
    }
    
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
                
                WelcomeView(welcomeText: enterPassword)
                    .padding(.top, 150)
                
                VStack(spacing: 20) {
                    
                    PrimeryTextField(
                        textFiledText: $vm.userPassword,
                        keyboardType: .constant(.emailAddress),
                        placeholderText: password,
                        imageIsHidden: true
                    )
                    .padding(.leading, 40)
                    
                    PrimeryButton(
                        buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
                        buttonText: enter,
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
    }
}

#Preview {
    EnterPasswordView()
}
