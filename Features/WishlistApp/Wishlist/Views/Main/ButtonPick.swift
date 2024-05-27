//
//  ButtonPick.swift
//  Wishlist
//
//  Created by admin on 5/10/24.
//

import SwiftUI

import Core
import AssetKit

public struct  ButtonPick: View {
    
    @State var title: String
    @State var icon: UIImage
    @State var buttonPressed: (() -> ())
    
    public var body: some View {
        VStack(spacing: .zero) {
            Button(action: {
                buttonPressed()
            }) {
                HStack(spacing: .zero) {
                    Text(title)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    
                    Spacer()
                    
                    Spacer()
                    
                    Image(uiImage: icon)
                        .padding()
                }
            }
            .frame(width: 350, height: 56)
            .background(Asset.Color.Button.grayCol.swiftUIColor)
            .clipShape(.capsule)
            .padding(.top)
        }
    }
}
