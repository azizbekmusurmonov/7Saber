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
    
        Card(image: "Agrobank",
             cardNumber: "8600 23** **** **84",
             expiryDate: "**/**"),
        Card(image: "MasterCard",
             cardNumber: "5623 43** **** **25",
             expiryDate: "**/**")
    
    ]
    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        VStack(spacing: .zero) {
           
            navBar
            Spacer()
            if cards.isEmpty {
                PaymentMethodViewIsEmpty()
            } else {
                ScrollView {
                    VStack(spacing: .zero) {
                        ForEach(cards, id: \.self) { card in
                            PaymentMethodItemView(card: card)
                        }
                        .padding()
                    }
                    .padding()
                }
            }
            addPaymentMethodButton
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
    
    var addPaymentMethodButton: some View {
        VStack(spacing: .zero) {
            Button(action: {
                
            }) {
                HStack(spacing: .zero) {
                    Text("ADD PAYMENT METHOD")
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
            .cornerRadius(26)
        }
        .padding()
    }
    
}

#Preview {
    PaymentMethodView()
}
