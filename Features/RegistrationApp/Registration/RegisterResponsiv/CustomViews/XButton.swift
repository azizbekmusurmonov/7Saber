//
//  XButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 20/04/24.
//

import SwiftUI
import AssetKit

extension View {
    func customXButton() -> some View {
        Button(action: {
            print("button tapped")
        }, label: {
            Image(uiImage: Asset.Image.Icons.closeX.image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
        })
        .frame(width: 36, height: 44)
    }
}
