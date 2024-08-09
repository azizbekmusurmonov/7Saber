//
//  TextFieldNextButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import AssetKit
import Core

struct TextFieldNextButton: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let nextButtonPressed: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    if let country = DataStorage.storage.get(from: .selectedCountry) as? String {
                        if country == "uz" {
                            PrimeryTextField(
                                textFiledText: $vm.numberText,
                                keyboardType: .constant(.emailAddress),
                                placeholderText: "Phone number",
                                isUzekistan: true
                            )
                        } else {
                            PrimeryTextField(
                                textFiledText: $vm.numberText,
                                keyboardType: .constant(.emailAddress),
                                placeholderText: "Phone number or Email"
                            )
                        }
                    }
                    
                    PrimeryButton(
                        buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
                        buttonText: "NEXT",
                        action: {
                            print("Button Tapped")
                            
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
