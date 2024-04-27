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
            VStack {
                NavigationBar(showButton: vm.codeLeftButton, leftButtonAction: {
                    
                    withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                        vm.isCodeViewPresented = false
                    }
                }, skipButtonAction: {
                    
                })
                WelcomeView(welcome: "WELCOME BACK", welcomeText: "Enter confirmation code to \ncontinue the proccess")
                    .padding(.top, 150)
                CodeTextFieldButton()
                    .environmentObject(vm)
                Spacer()
            }
            
        }
    }
}

#Preview {
    CodeViewAccountExists()
}
