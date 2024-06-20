//
//  SaveCancelButtons.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 03/05/24.
//

import SwiftUI
import Core
import AssetKit

public struct SaveCancelButtons: View {
    
    var title: String
    var color: Color
    var textColor: Color
    var buttonPressed: (() -> ())
    
    @Binding var isDisabled: Bool
    
    public var body: some View {
        VStack(spacing: .zero) {
            Button(action: {
                if !isDisabled {
                    buttonPressed()
                }
            }) {
                Text(title)
                    .font(.system(size: 16, weight: .regular))
                    .padding()
                    .frame(width: 180)
                    .foregroundColor(textColor)
            }
            .background(isDisabled ? AddButtonBacgrounColor.disable.buttonBacgroundColor : color)
            .clipShape(.capsule)
            .disabled(isDisabled)
        }
    }
}
