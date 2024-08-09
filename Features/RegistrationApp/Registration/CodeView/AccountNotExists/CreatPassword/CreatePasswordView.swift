//
//  CreatePasswordView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 01/05/24.
//

import SwiftUI
import Core
import AssetKit

struct CreatePasswordView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let skipButtonTapped: () -> ()
    
    let creatPassword: String
    let password: String
    let retryPassword: String
    let enter: String
    
    init(skipButtonTapped: @escaping () -> Void, creatPassword: String = Localizations.createAPassword, password: String = Localizations.password, retryPassword: String = Localizations.reTypePassword, enter: String = Localizations.enter) {
        self.skipButtonTapped = skipButtonTapped
        self.creatPassword = creatPassword
        self.password = password
        self.retryPassword = retryPassword
        self.enter = enter
    }
    
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
                
                WelcomeView(welcomeText: creatPassword)
                    .padding(.top, 150)
                
                VStack(spacing: 20) {
                    
                    PrimeryTextField(
                        textFiledText: $vm.userPassword,
                        keyboardType: .constant(.emailAddress),
                        placeholderText: password,
                        imageIsHidden: true
                    )
                    .padding(.leading, 40)
                    
                    PrimeryTextField(
                        textFiledText: $vm.userRetryPassword,
                        keyboardType: .constant(.emailAddress),
                        placeholderText: retryPassword,
                        imageIsHidden: true
                    )
                    .padding(.leading, 40)
                    
                    PrimeryButton(
                        buttonBacround: vm.userPassword.isEmpty || vm.userRetryPassword.isEmpty ? .constant(.gray) : .constant(.black),
                        buttonText: enter,
                        action: {
                            if vm.isPasswordValid(vm.userPassword) {
                                if vm.userPassword == vm.userRetryPassword {
                                    vm.emailRegistration()
                                } else {
                                    vm.message = .error(message: "Пароли не совпадают.")
                                }
                            } else {
                                vm.message = .error(message: "Ваш пароль должен состоять не менее чем из 8 символов и содержать комбинацию букв, цифр и специальных символов (например, !, @, #).")
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

