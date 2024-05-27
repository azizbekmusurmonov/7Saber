//
//  CreatePasswordView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 01/05/24.
//

import SwiftUI
import Core

struct CreatePasswordView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let skipButtonTapped: () -> ()
    
    var body: some View {
        ZStack {
            VStack {
                
                NavigationBar(
                    showButton: vm.isCodeViewPresented,
                    leftButtonAction: {
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            vm.isPasswordViewPresent.toggle()
                        }
                    },
                    skipButtonAction: {
                        skipButtonTapped()
                        DataStorage.storage.save(true, for: .isRegistrate)
                    }
                )
                
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
                            if vm.userPassword == vm.userRetryPassword {
                                vm.emailRegistration()
                            } else {
                                vm.message = .error(message: "Parol bir biriga mos emas")
                            }
                        }
                    )
                    
                    Spacer()
                }
            }
            .onChange(of: vm.forcelyOpenTabBar) { newValue in
                if newValue  {
                    skipButtonTapped()
                }
            }
        }
    }
}

#Preview {
    CreatePasswordView(skipButtonTapped: {})
}
