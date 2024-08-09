//
//  TextFieldNextButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import AssetKit
import Core
import AssetKit

struct TextFieldNextButton: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let nextButtonPressed: () -> Void
    
    let phoneOrEmail: String
    let next: String
    
    init(nextButtonPressed: @escaping () -> Void, phoneOrEmail: String = Localizations.phoneNumberOrEmail, next: String = Localizations.next) {
        self.nextButtonPressed = nextButtonPressed
        self.phoneOrEmail = phoneOrEmail
        self.next = next
    }
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    if let country = DataStorage.storage.get(from: .selectedCountry) as? String {
                        if country == "uz" {
                            PrimeryTextField(
                                textFiledText: $vm.numberText,
                                keyboardType: .constant(.emailAddress),
                                placeholderText: "Telefon raqamingiz",
                                isUzekistan: true
                            )
                        } else {
                            PrimeryTextField(
                                textFiledText: $vm.numberText,
                                keyboardType: .constant(.emailAddress),
                                placeholderText: phoneOrEmail
                            )
                        }
                    }
                    
                    PrimeryButton(
                        buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
                        buttonText: next,
                        action: {
                            
                            nextButtonPressed()
                        }
                    )
                    .padding(.top, 20)
                    Spacer()
                }
                .padding(.leading, 40)
                Spacer()
            }
        }
    }
}

//#Preview {
//    TextFieldNextButton(nextButtonPressed: { })
//}
