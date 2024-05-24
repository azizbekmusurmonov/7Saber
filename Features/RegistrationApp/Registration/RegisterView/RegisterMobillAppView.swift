//
//  RegisterMobillAppView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 20/04/24.
//

import SwiftUI
//import Home
import Core

public struct RegisterMobillAppView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let skipButtonTapped: () -> ()
    
    public init(skipButtonTapped: @escaping () -> ()) {
        self.skipButtonTapped = skipButtonTapped
    }
    
    public var body: some View {
        ZStack {
            VStack {
                if !vm.isCodeViewPresented {
                    
                    // NAV BAR
                    NavigationBar(
                        showButton: vm.isCodeViewPresented,
                        leftButtonAction: { },
                        skipButtonAction: {
                            skipButtonTapped()
                            DataStorage.storage.save(true, for: .isRegistrate)
                        }
                    )
                    
                    WelcomeView(welcome: "WELCOME", welcomeText: "Enter your phone number \nor email to continue")
                        .padding(.top, 150)
                    TextFieldNextButton(nextButtonPressed: {
                        if !vm.numberText.isEmpty {
                            vm.getCodeButtonPressed()
                        }
                    })
                        .environmentObject(vm)
                        .padding(.top, 40)
                    Spacer()
                } else {
                    ZStack {
                        CodeViewAccountExists(skipButtonTapped: {})
                            .environmentObject(vm)
                            .opacity(vm.userExists ? 1 : 0)
                        CodeViewAccountNotExists(skipButtonTapped: {})
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
            .onChange(of: vm.forcelyOpenTabBar) { newValue in
                if newValue  {
                    skipButtonTapped()
                }
            }
        }
    }
}


#Preview {
    RegisterMobillAppView(skipButtonTapped: { })
}

