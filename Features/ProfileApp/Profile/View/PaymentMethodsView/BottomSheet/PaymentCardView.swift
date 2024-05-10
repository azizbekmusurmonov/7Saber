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
            NameCardView()
            Spacer()
            HStack(spacing: .zero) {
                CardDateView()
                Spacer()
                CardCvvView()
            }
        }
        .padding()
        .frame(height: 200)
        .cornerRadius(20)
        .background(Asset.Color.Surface.Card.color.swiftUIColor)
    }
}
