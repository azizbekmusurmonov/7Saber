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
    
    @State var title: String
    @State var color: Color
    @State var textColor: Color
    @State var buttonPressed: (() -> ())
    
    public var body: some View {
        VStack(spacing: .zero) {
            Button(action: {
                buttonPressed()
            }) {
                Text(title)
                    .padding()
                    .frame(width: 180)
                    .font(.footnote)
                    .foregroundColor(textColor)
            }
            .background(color)
            .clipShape(.capsule)
            .padding(.leading)
        }
    }
}
