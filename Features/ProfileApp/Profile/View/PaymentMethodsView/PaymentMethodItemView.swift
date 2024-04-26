//
//  PaymentMethodItemView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import Foundation
import SwiftUI
import AssetKit
import Core

struct PaymentMethodItemView: View {
    
    var card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
                
                Text(card.image)
            Spacer()
                
                Text(card.cardNumber)

                HStack(spacing: .zero) {
                    Text(card.expiryDate)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("SHOW")
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                }
            }
        }
        .padding()
        .frame(width: 360, height: 200)
        .cornerRadius(20)
        .background(Asset.Color.Surface.Card.color.swiftUIColor)
    }
}

