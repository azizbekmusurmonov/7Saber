//
//  PaymentMethodItemView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI
import AssetKit
import Core

struct PaymentMethodItemView: View {
    
    @State var card: Card
    @State var isExpiryDateHidden = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: Asset.Image.BankImage.agrobank.image)
                .resizable()
                .frame(width: 72, height: 14)
            Spacer()
            Text(card.cardNumber)
            HStack(spacing: .zero) {
                if isExpiryDateHidden {
                    Text("****")
                } else {
                    Text(card.expiryDate)
                }
                Spacer()
                Button(action: {
                    isExpiryDateHidden.toggle()
                }) {
                    Text(isExpiryDateHidden ? "SHOW" : "HIDE")
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                }
            }
        }
        .padding()
        .frame(height: 200)
        .background(Asset.Color.Surface.Card.color.swiftUIColor)
    }
}
