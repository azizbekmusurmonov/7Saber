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
    @State private var isShowRegistrView: Bool = false
    
    let skipButtonTapped: () -> ()
    
    public init(skipButtonTapped: @escaping () -> ()) {
        self.skipButtonTapped = skipButtonTapped
    }
    
    public var body: some View {
        if isShowRegistrView == false || (DataStorage.storage.get(from: .isShowedOnBoarding) == nil)  {
            OnBoardingView {
                isShowRegistrView = true
                DataStorage.storage.save(true, for: .isShowedOnBoarding)
            }
        } else {
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
                        .frame(width: UIScreen.main.bounds.width)
                    TextFieldNextButton(nextButtonPressed: {
                        if !vm.numberText.isEmpty {
                            vm.getEmailOrNumberButtonPressed()
                        }
                    })
                        .environmentObject(vm)
                        .padding(.top, 40)
                    Spacer()
                } else {
                    ZStack {
                        if vm.isLoading {
                            
                            if (vm.numberText.contains("@gmail.com") || vm.numberText.contains("@icloud.com")) {
                                EnterPasswordView()
                                    .environmentObject(vm)
                                    .opacity(vm.userExists ? 1 : 0)
                            } else if vm.numberText.contains("+998") && vm.numberText.count == 13 {
                                CodeViewAccountExists(skipButtonTapped: {})
                                    .environmentObject(vm)
                                    .opacity(vm.userExists ? 1 : 0)
                            }
                            CodeViewAccountNotExists(skipButtonTapped: {})
                                .environmentObject(vm)
                                .opacity(vm.userExists ? 0 : 1)
                        } else {
                            iOSSpinner()
//                                .padding(.top, 150)
                        }
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

