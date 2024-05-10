//
//  RegisterMobillAppView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 20/04/24.
//

import SwiftUI
import Home
import Core

public struct RegisterMobillAppView: View {
    
    @StateObject var vm = RegisterMobillAppViewModel() 
    
    let skipButtonTapped: () -> ()
    
    public init (skipButtonTapped: @escaping () -> ()) {
        self.skipButtonTapped = skipButtonTapped
    }
    
    public var body: some View {
        ZStack {
            VStack {
                // NAV BAR
                NavigationBar(
                    showButton: vm.isCodeViewPresented,
                    leftButtonAction: {
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            vm.isCodeViewPresented.toggle()
                            vm.isFullNameViewPresent.toggle()
                            vm.isPasswordViewPresent.toggle()
                        }
                    },
                    skipButtonAction: {
                       
                        skipButtonTapped()
                        DataStorage.storage.save(true, for: .isRegistrate)
                    }
                )
               
                if !vm.isCodeViewPresented {
                    WelcomeView(welcome: "WELCOME", welcomeText: "Enter your phone number \nor email to continue")
                        .padding(.top, 150)
                    TextFieldNextButton(nextButtonPressed: {
                        
                        vm.remainingSeconds = 120
                        vm.getUser()
                        vm.sendCode()
                    })
                        .environmentObject(vm)
                        .padding(.top, 40)
                    Spacer()
                } else {
                    ZStack {
                        CodeViewAccountExists()
                            .environmentObject(vm)
                            .opacity(vm.userExists ? 1 : 0)
                        CodeViewAccountNotExists()
                            .environmentObject(vm)
                            .opacity(vm.userExists ? 0 : 1)
                    }
                }
            }
            .onChange(of: vm.message) { newValue in
                guard let newValue else { return }
                switch newValue {
                case .success(message: let message):
                    Snackbar.show(message: message, theme: .success)
                case .error(message: let message):
                    Snackbar.show(message: message, theme: .error)
                }
            }
        }
    }
}

#Preview {
    RegisterMobillAppView(skipButtonTapped: { })
}

