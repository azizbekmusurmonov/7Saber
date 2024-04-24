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
                VStack {
                    ZStack(alignment: .leading) {
                        Text("Phone number or Email")
                            .foregroundColor(.gray)
                            .font(
                                .system(
                                    size:
                                        vm.numberTextFieldIsEditing || !vm.numberText.isEmpty ? 11 : 16
                                )
                            )
                            .offset(y: vm.numberTextFieldIsEditing || !vm.numberText.isEmpty ? -26 : 0)
                        
                        TextField("", text: $vm.numberText, onEditingChanged: { editing in
                            withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                                vm.numberTextFieldIsEditing = editing
                            }
                        })
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 313, height: 48)
                        .keyboardType(.emailAddress)
                    }
                    .overlay(Rectangle().frame(height: 1).padding(.top, 8).foregroundColor(.gray), alignment: .bottom)
                    Button(action: {
                        print("NEXT Button Tapped")
                        
                        nextButtonPressed()
                        
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            vm.isCodeViewPresented = true
                        }

                    }, label: {
                        Text("NEXT")
                    })
                    .frame(width: 313, height: 56)
                    .background(vm.numberText.isEmpty ? Asset.Color.Button.Black.disable.swiftUIColor : Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(100)
                    .padding(.top, 20)
                    Spacer()
                }
                .padding(.leading, 40)
                Spacer()
            }
        }
    }
}

#Preview {
    TextFieldNextButton(nextButtonPressed: { })
}
