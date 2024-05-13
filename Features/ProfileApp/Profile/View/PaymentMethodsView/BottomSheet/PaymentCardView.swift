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
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Image(uiImage: bankLogo)
                .resizable()
                .frame(width: 72, height: 14)
            Spacer()
            CardNumberView()
                .frame(height: 20)
            NameCardView()
                .frame(height: 20)
            Spacer()
            HStack(spacing: .zero) {
                CardDateView()
                    .frame(height: 20)
                Spacer()
                CardCvvView()
                    .frame(height: 20)
            }
        }
        .padding(16)
        .frame(height: 200)
        .cornerRadius(20)
        .background(Asset.Color.Surface.Card.color.swiftUIColor)
    }
}
