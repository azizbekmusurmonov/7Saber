//
//  FullNameView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 02/05/24.
//

import SwiftUI

struct FullNameView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var body: some View {
        ZStack {
            if !vm.isPasswordViewPresent {
                VStack {
                    WelcomeView(welcomeText: "It looks like we don’t have your account. \nPlease fill up the following fields \nto continue")
                        .padding(.top, 150)
                    
                    VStack(spacing: 20) {
                        
                        PrimeryTextField(
                            textFiledText: $vm.userFullName,
                            keyboardType: .constant(.emailAddress),
                            placeholderText: "Fullname"
                        )
                        .padding(.leading, 40)
                        
                        PrimeryTextField(
                            textFiledText: $vm.numberText,
                            keyboardType: .constant(.emailAddress),
                            placeholderText: "Phone number or Email"
                        )
                        .padding(.leading, 40)
                        
                        PrimeryButton(
                            buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
                            buttonText: "ENTER",
                            action: {
                                withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                                    vm.isPasswordViewPresent.toggle()
                                }
                            }
                        )
                        Spacer()
                    }
                }
            } else {
                CreatePasswordView()
                    .environmentObject(vm)
            }
        }
    }
}

#Preview {
    FullNameView()
}
