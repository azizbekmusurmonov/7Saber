//
//  PaymentAddCardView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import SwiftUI
import Core
import AssetKit

struct PaymentAddCardView: View {
    var body: some View {
        VStack(spacing: .zero) {
            BottomSheetsNavBar(title: "ADDED CREDIT CARD")
            PaymentCardView(bankLogo: Asset.Image.BankImage.agrobank.image)
                .cornerRadius(10)
                .padding()
            AddButton(title: "ADD CARD") {
                print("add card")
            }
        }
        .padding()
    }
}

#Preview {
    PaymentAddCardView()
}
