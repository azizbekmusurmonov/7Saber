//
//  FullNameView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 02/05/24.
//

import SwiftUI
import Core
import AssetKit

struct FullNameView: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let skipButtonTapped: () -> ()
    
    let itLooks: String
    let fullName: String
    let phoneOrEmail:String
    let enter: String

    init(skipButtonTapped: @escaping () -> Void, itLooks: String = Localizations.itLooksLikeWeDontHaveYourAccount, fullName: String = Localizations.fullName, phoneOrEmail: String = Localizations.phoneNumberOrEmail, enter: String = Localizations.enter) {
        self.skipButtonTapped = skipButtonTapped
        self.itLooks = itLooks
        self.fullName = fullName
        self.phoneOrEmail = phoneOrEmail
        self.enter = enter
    }
    
    var body: some View {
        ZStack {
            if !vm.isPasswordViewPresent {
                VStack {
                    
                    NavigationBar(
                        showButton: vm.isCodeViewPresented,
                        leftButtonAction: {
                            withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                                vm.isFullNameViewPresent.toggle()
                            }
                        },
                        skipButtonAction: {
                            skipButtonTapped()
                            DataStorage.storage.save(true, for: .isRegistrate)
                        }
                    )
                    
                    WelcomeView(welcomeText: itLooks)
                        .padding(.top, 150)
                    
                    VStack(spacing: 20) {
                        
                        PrimeryTextField(
                            textFiledText: $vm.userFullName,
                            keyboardType: .constant(.emailAddress),
                            placeholderText: fullName
                        )
                        .padding(.leading, 40)
                        
                        PrimeryTextField(
                            textFiledText: $vm.numberText,
                            keyboardType: .constant(.emailAddress),
                            placeholderText: phoneOrEmail
                        )
                        .padding(.leading, 40)
                        
                        PrimeryButton(
                            buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
                            buttonText: enter,
                            action: {
                                withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                                    vm.isPasswordViewPresent.toggle()
                                }
                            }
                        )
                        Spacer()
                    }
                }
                .onChange(of: vm.forcelyOpenTabBar) { newValue in
                    if newValue  {
                        skipButtonTapped()
                    }
                }
            } else {
                CreatePasswordView(skipButtonTapped: {})
                    .environmentObject(vm)
            }
        }
    }
}

#Preview {
    FullNameView(skipButtonTapped: {})
}
