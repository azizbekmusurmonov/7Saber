//
//  CodeViewAccountExists.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 28/04/24.
//

import SwiftUI

struct CodeViewAccountExists: View {
    
    @StateObject var vm = RegisterMobillAppViewModel()
    
    var body: some View {
        ZStack {
            
            if vm.isPasswordViewPresent {
                EnterPasswordView()
                    .environmentObject(vm)
            } else {
                VStack {
                    WelcomeView(welcome: "WELCOME BACK", welcomeText: "Enter confirmation code to \ncontinue the proccess")
                        .padding(.top, 150)
                    
                    CodeTextFieldButton(enterButtonAction: {
                        vm.checkCode()
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            vm.isPasswordViewPresent.toggle()
                        }
                    })
                        .environmentObject(vm)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    CodeViewAccountExists()
}
