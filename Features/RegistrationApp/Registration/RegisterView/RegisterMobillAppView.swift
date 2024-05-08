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
                        }
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            vm.isFullNameViewPresent.toggle()
                        }
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
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
                        vm.stopTimer()
                        vm.startTimer()
//                        vm.sendCode()
                        vm.getUser()
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
        }
    }
}

#Preview {
    RegisterMobillAppView(skipButtonTapped: { })
}
