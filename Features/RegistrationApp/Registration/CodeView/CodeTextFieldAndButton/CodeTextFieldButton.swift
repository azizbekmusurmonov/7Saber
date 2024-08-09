//
//  TextFieldNextButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI

struct CodeTextFieldButton: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var enterButtonAction: () -> ()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                PrimeryTextField(
                    textFiledText: $vm.codeText,
                    keyboardType: .constant(.numberPad),
                    placeholderText: "Code"
                )
                
                Text("We have sent to your phone number \(vm.numberText) \na 5-digit number, please enter that code to confirm.") // numberText
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                    .padding(.top, 16)
                
                Text("\(String(format: "%02d:%02d", vm.remainingSeconds / 60, vm.remainingSeconds % 60))") // timerText
                        .font(.system(size: 11))
                        .padding(.top, 7)
                
                SendAgainButton()
                
                PrimeryButton(
                    buttonBacround: vm.numberText.isEmpty ? .constant(.gray) : .constant(.black),
                    buttonText: "ENTER",
                    action: {
                        enterButtonAction()
                    }
                )
                .padding(.top, (vm.remainingSeconds != 0) ? -62 : 21)

                Spacer()
            }
            .padding(.leading, 40)
            Spacer()
        }
    }
}

#Preview {
    CodeTextFieldButton {
        
    }.environmentObject(RegisterMobillAppViewModel())
}
