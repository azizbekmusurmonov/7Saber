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
                NavigationBar(
                    showButton: vm.registerLeftButton,
                    leftButtonAction: { },
                    skipButtonAction: { 
                        skipButtonTapped()
                        DataStorage.storage.save(true, for: .isRegistrate )
                    }
                )
                WelcomeView(welcome: "WELCOME", welcomeText: "Enter your phone number \nor email to continue")
                    .padding(.top, 150)
                TextFieldNextButton(nextButtonPressed: {
                    
                    vm.remainingSeconds = 120
                    vm.stopTimer()
                    vm.startTimer()
                    
                    vm.getUser() 
                    vm.sendCode()
                })
                    .environmentObject(vm)
                    .padding(.top, 40)
                Spacer()
            }.opacity(!vm.isCodeViewPresented ? 1 : 0)
            
            if vm.userExists {
                CodeViewAccountExists()
                    .environmentObject(vm)
                    .opacity(vm.isCodeViewPresented ? 1 : 0)
            } else {
                CodeViewAccountNotExists()
                    .environmentObject(vm)
                    .opacity(vm.isCodeViewPresented ? 1 : 0)
            }
        }
    }
}

#Preview {
    RegisterMobillAppView(skipButtonTapped: { })
}
