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
                WelcomeView(welcomeText: "Enter your phone number \nor email to continue")
                    .padding(.top, 150)
                TextFieldNextButton(nextButtonPressed: {
                    
                    vm.remainingSeconds = 120
                    vm.stopTimer()
                    vm.startTimer()
                    
                    vm.sendCode()
                })
                    .environmentObject(vm)
                    .padding(.top, 40)
                Spacer()
            }.opacity(!vm.isCodeViewPresented ? 1 : 0)
            
            CodeView()
                .environmentObject(vm)
                .opacity(!vm.isCodeViewPresented ? 0 : 1)
        }
    }
}

#Preview {
    RegisterMobillAppView(skipButtonTapped: { })
}
