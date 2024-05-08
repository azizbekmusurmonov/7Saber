//
//  AddButton.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 01/05/24.
//

import SwiftUI
import Core
import AssetKit

public struct AddButton: View {
    
    @State var title: String
    @State var buttonPressed: (() -> ())
        
    public var body: some View {
        VStack(spacing: .zero) {
            Button(action: {
                buttonPressed()
            }) {
                HStack(spacing: .zero) {
                    Text(title)
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.whiteCol.swiftUIColor)
                    Spacer()
                    Image(uiImage: Asset.Image.Icons.plusCrcleWhite.image)
                        .resizable()
                        .frame(width: 18.33, height: 18.33)
                }
            }
            .padding()
            .frame(width: 361,height: 56)
            .background(Asset.Color.Button.blackCol.swiftUIColor)
            .clipShape(.capsule)
        }
        .padding()
    }
}

