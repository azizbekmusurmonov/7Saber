//
//  PaymentMethodViewIsEmpty.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI
import AssetKit
import Core

struct PaymentMethodViewIsEmpty: View {
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    Image(uiImage: Asset.Image.Icons.creditCard.image)
                        .resizable()
                        .frame(width: 26.67, height: 26.67)
                    Text("THERE IS NO CREDIT CARD")
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text("Seems credit card has not been added yet(")
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
    PaymentMethodViewIsEmpty()
}
