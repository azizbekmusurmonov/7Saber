//
//  CodeView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import Core
import AssetKit

struct CodeViewAccountNotExists: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let skipButtonTapped: () -> ()
    
    let welcome: String
    let enterCode: String
    
    init(skipButtonTapped: @escaping () -> Void, welcome: String = Localizations.welcome, enterCode: String = Localizations.enterConfirmationCodeToContinueTheProcess) {
        self.skipButtonTapped = skipButtonTapped
        self.welcome = welcome
        self.enterCode = enterCode
    }
    
    var body: some View {
        ZStack {
            
            if vm.isFullNameViewPresent {
                FullNameView(skipButtonTapped: {})
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
                    
                    WelcomeView(welcome: welcome, welcomeText: enterCode)
                        .padding(.top, 150)
                    CodeTextFieldButton(enterButtonAction: {
                        if !vm.codeText.isEmpty {
                            if (vm.numberText.contains("@gmail.com") || vm.numberText.contains("@icloud.com")) {
                                
                                vm.checkCode()        
                                
                            } else if vm.numberText.contains("+998") && vm.numberText.count >= 9 {
                                
                                vm.phoneRegistration()
                            }
                        } else {
                            vm.message = .error(message: "Please enter  the code")
                        }
                    })
                    .environmentObject(vm)
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
    CodeViewAccountNotExists(skipButtonTapped: {})
}
