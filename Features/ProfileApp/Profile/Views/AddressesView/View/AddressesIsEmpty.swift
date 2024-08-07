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
                    Text(Localizations.youDontHaveAddress)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text(Localizations.seemsYouHaveNotAddedYourAddressYet)
                        .font(.system(size: 16, weight: .medium))
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
