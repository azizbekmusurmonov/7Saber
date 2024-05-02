//
//  TextFieldNextButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import AssetKit

struct TextFieldNextButton: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let nextButtonPressed: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    PrimeryTextField(
                        textFiledText: $vm.numberText,
                        keyboardType: .constant(.emailAddress),
                        placeholderText: "Phone number or Email"
                    )
                    
                    PrimeryButton(
                        buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
                        buttonText: "NEXT",
                        action: {
                            print("Button Tapped")
                            
                            nextButtonPressed()
                            
                            withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                                vm.isCodeViewPresented = true
                            }
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
