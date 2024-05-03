//
//  PaymentMethodView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import AssetKit
import Core

struct PaymentMethodView: View {
    
    @State var cards: [Card] = [
        Card(image: Asset.Image.BankImage.agrobank.image,
             cardNumber: "8600 23** **** **84",
             expiryDate: "12/27"),
        Card(image: Asset.Image.BankImage.masterCard.image,
             cardNumber: "5623 43** **** **25",
             expiryDate: "12/24")
    ]

    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        VStack(spacing: .zero) {
           
            navBar
            Spacer()
            if cards.isEmpty {
                PaymentMethodViewIsEmpty()
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: .zero) {
                        ForEach(cards, id: \.self) { card in
                            PaymentMethodItemView(card: card)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                }
            }
            AddButton(title: "ADD PAYMENT METHOD", buttonPressed: {
                print("pressed")
            })
        }
        .navigationBarBackButtonHidden()
    }
}

extension PaymentMethodView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "PAYMENT METHODS ",
                              leftImage: Asset.Image.Navigation.arrowLeftNav.image,
                              leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
    }
}

#Preview {
    PaymentMethodView()
}
