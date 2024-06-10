//
//  AddButton.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 01/05/24.
//

import SwiftUI
import Core
import AssetKit

public enum AddButtonBacgrounColor {
    case black
    case disable
    
    var buttonBacgroundColor: Color {
        switch self {
        case .black: 
            return Asset.Color.Button.blackCol.swiftUIColor
        case .disable: 
            return Asset.Color.Button.Black.disable.swiftUIColor
        }
    }
}

public struct AddButton: View {
    
    let title: String
    let buttonPressed: (() -> ())
    @Binding var isDisabled: Bool
    
    public var body: some View {
        VStack(spacing: .zero) {
            Button(action: {
                if !isDisabled {
                    buttonPressed()
                }
            }) {
                HStack(spacing: .zero) {
                    Text(title)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Asset.Color.Text.whiteCol.swiftUIColor)
                    Spacer()
                    Image(uiImage: Asset.Image.Icons.plusCrcleWhite.image)
                        .resizable()
                        .frame(width: 18.33, height: 18.33)
                }
            }
            .padding()
            .frame(width: 361,height: 56)
            .background(isDisabled ? AddButtonBacgrounColor.disable.buttonBacgroundColor : AddButtonBacgrounColor.black.buttonBacgroundColor)
            .clipShape(.capsule)
            .disabled(isDisabled)
        }
        .padding()
    }
}
