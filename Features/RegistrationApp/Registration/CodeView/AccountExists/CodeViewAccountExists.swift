//
//  CodeViewAccountExists.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 28/04/24.
//

import SwiftUI
import Core

struct CodeViewAccountExists: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let skipButtonTapped: () -> ()
    
    var body: some View {
        ZStack {
            
            if vm.isPasswordViewPresent {
                EnterPasswordView()
                    .environmentObject(vm)
            } else {
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
                            skipButtonTapped()
                            DataStorage.storage.save(true, for: .isRegistrate)
                        }
                    )
                    
                    WelcomeView(welcome: "WELCOME BACK", welcomeText: "Enter confirmation code to \ncontinue the proccess")
                        .padding(.top, 150)
                    
                    CodeTextFieldButton(enterButtonAction: {
                        vm.isLoading = true
                        vm.loginForNumber()
                        vm.isLoading = false
                    })
                        .environmentObject(vm)
                    
                    if !vm.isLoading {
                        iOSSpinner()
                    }
                    Spacer()
                }
                .onChange(of: vm.forcelyOpenTabBar) { newValue in
                    if newValue  {
                        skipButtonTapped()
                    }
                }
            }
        }
    }
}

#Preview {
    CodeViewAccountExists(skipButtonTapped: { })
}
