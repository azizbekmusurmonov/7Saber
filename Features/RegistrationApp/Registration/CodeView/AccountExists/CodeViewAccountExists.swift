//
//  CodeViewAccountExists.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 28/04/24.
//

import SwiftUI

struct CodeViewAccountExists: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var body: some View {
        ZStack {
            VStack {
                WelcomeView(welcome: "WELCOME BACK", welcomeText: "Enter confirmation code to \ncontinue the proccess")
                    .padding(.top, 150)
                CodeTextFieldButton(enterButtonAction: {
                    
                })
                    .environmentObject(vm)
                Spacer()
            }
            
        }
    }
}

#Preview {
    CodeViewAccountExists()
}
