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
    
    @State private var cardNumber: String = ""
    @State private var expirationDate: String = ""
    @State private var nameCard: String = ""
    @State private var cvvCard: String = ""
    
    var isAddButtonEnabled: Bool {
        return !cardNumber.isEmpty && !expirationDate.isEmpty && !nameCard.isEmpty && !cvvCard.isEmpty
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            BottomSheetsNavBar(title: "ADDED CREDIT CARD")
            PaymentCardView(bankLogo: Asset.Image.BankImage.agrobank.image,
                            cardNumber: $cardNumber,
                            expirationDate: $expirationDate,
                            nameCard: $nameCard,
                            cvvCard: $cvvCard)
            .cornerRadius(10)
            .padding()
            AddButton(title: "ADD CARD", buttonPressed: {
                print("add card")
            }, isDisabled: !isAddButtonEnabled)
        }
        .padding()
    }
}

#Preview {
    PaymentAddCardView()
}
