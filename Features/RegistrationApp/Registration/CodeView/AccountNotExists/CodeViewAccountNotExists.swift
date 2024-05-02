//
//  CodeView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI

struct CodeViewAccountNotExists: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var body: some View {
        ZStack {
            
            if vm.isFullNameViewPresent {
                FullNameView()
                    .environmentObject(vm)
            } else {
                VStack {
                    WelcomeView(welcome: "WELCOME", welcomeText: "Enter confirmation code to \ncontinue the proccess")
                        .padding(.top, 150)
                    CodeTextFieldButton(enterButtonAction: {
                        
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            vm.isFullNameViewPresent.toggle()
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
    CodeViewAccountNotExists()
}
