//
//  AddressesIsEmpty.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI
import AssetKit
import Core

struct AddressesIsEmpty: View {
    var body: some View {
        
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    Image(uiImage: Asset.Image.Icons.globe.image)
                        .resizable()
                        .frame(width: 26.67, height: 26.67)
                    Text("YOU DON’T HAVE ADDRESS")
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text("Seems you have not added your address yet")
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    AddressesIsEmpty()
}
