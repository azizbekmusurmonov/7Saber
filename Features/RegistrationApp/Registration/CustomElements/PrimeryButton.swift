//
//  PrimeryButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 01/05/24.
//

import SwiftUI

enum ButtonBacgrounColor {
    case black
    case gray
    
    var buttonBacgroundColor: Color {
        switch self {
        case .black: .black
        case .gray: .gray
        }
    }
}

struct PrimeryButton: View {
    
    @Binding var buttonBacround: ButtonBacgrounColor
    @State var buttonText: String = "NEXT"
    @State var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 80, height: 56)
                .foregroundColor(.white)
                .background(buttonBacround.buttonBacgroundColor)
                .clipShape(.capsule)
        }

    }
}

#Preview {
    PrimeryButton(buttonBacround: .constant(.gray), action: { })
}
