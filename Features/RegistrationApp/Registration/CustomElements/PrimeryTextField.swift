//
//  PrimeryTextField.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 01/05/24.
//

import SwiftUI

enum KeyboardType {
    case emailAddress
    case numberPad
    case alphabet
    case decimalPad
    
    var getKeyboardType: UIKeyboardType {
        switch self {
        case .emailAddress:
            return .emailAddress
        case .numberPad:
            return .numberPad
        case .alphabet:
            return .alphabet
        case .decimalPad:
            return .decimalPad
        }
    }
}

struct PrimeryTextField: View {
    
    @Binding var textFiledText: String
    @Binding var keyboardType: KeyboardType
    @State var placeholderText: String
    @State var textFieldIsEditing: Bool = false
    @State var imageName: String = "eye"
    @State var imageIsHidden: Bool = false
    @State var eyeSeeOrNotSee: Bool = true
    @State var isUzekistan: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholderText)
                .foregroundColor(.gray)
                .font(
                    .system(
                        size: textFieldIsEditing || !textFiledText.isEmpty ? 11 : 16
                    )
                )
                .offset(y: textFieldIsEditing || !textFiledText.isEmpty ? -26 : 0)
            
            HStack {
                TextField("", text: $textFiledText, onEditingChanged: { editing in
                    withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                        textFieldIsEditing = editing
                    }
                })
                .textFieldStyle(.plain)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 80, height: 48)
                .keyboardType(keyboardType.getKeyboardType)
                .hideKeyboardOnTap()
                .onAppear {
                    if isUzekistan && textFiledText.isEmpty {
                        textFiledText = "+998"
                    }
                }
            }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .padding(.top, 8)
                    .foregroundColor(.gray),
                alignment: .bottom
            )
            HStack {
                Spacer()
                if imageIsHidden {
                    Image(systemName: eyeSeeOrNotSee ? "eye" : "eye.slash")
                        .padding()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            eyeSeeOrNotSee.toggle()
                        }
                        .animation(
                            .easeOut(duration: .animationDuration.short),
                            value: eyeSeeOrNotSee
                        )
                }
            }
            .padding(.trailing, 40)
        }
    }
}

#Preview {
    PrimeryTextField(textFiledText: .constant(""), keyboardType: .constant(.emailAddress), placeholderText: "")
}
