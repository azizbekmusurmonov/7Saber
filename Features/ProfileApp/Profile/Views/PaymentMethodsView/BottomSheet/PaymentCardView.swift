//
//  PaymentCardView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 08/05/24.
//

import SwiftUI
import Core
import AssetKit

struct PaymentCardView: View {
    
    @State var bankLogo: UIImage
    @State var cardType: CardType = .mastercard
    
    @Binding var cardNumber: String
    @Binding var expirationDate: String
    @Binding var nameCard: String
    @Binding var cvvCard: String
    
    enum CardType {
        case visa
        case mastercard
        case unknown
    }
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Image(uiImage: bankLogo)
                .resizable()
                .frame(width: 72, height: 14)
            Spacer()
            CardNumberView()
            if cardType == .visa || cardType == .mastercard {
                Spacer()
                NameCardView()
            }
            
            Spacer()
            HStack(spacing: .zero) {
                CardDateView()
                Spacer()
                if cardType == .visa || cardType == .mastercard {
                    CardCvvView()
                }
            }
        }
        .padding(16)
        .frame(height: 200)
        .cornerRadius(20)
        .background(Asset.Color.Surface.Card.color.swiftUIColor)
    }
}
