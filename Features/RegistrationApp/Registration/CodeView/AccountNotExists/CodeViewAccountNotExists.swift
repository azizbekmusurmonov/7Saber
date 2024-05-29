//
//  CodeView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import Core

struct CodeViewAccountNotExists: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let skipButtonTapped: () -> ()
    
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
                    
                    WelcomeView(welcome: "WELCOME", welcomeText: "Enter confirmation code to \ncontinue the proccess")
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
