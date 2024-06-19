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
    
    @EnvironmentObject private var vm: PaymentFormViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            BottomSheetsNavBar(title: "ADDED CREDIT CARD")
            PaymentCardView(bankLogo: Asset.Image.BankImage.agrobank.image,
                            cardNumber: $vm.cardNumber,
                            expirationDate: $vm.expirationDate,
                            nameCard: $vm.nameCard,
                            cvvCard: $vm.cvvCard)
            .cornerRadius(10)
            .padding()
            AddButton(title: "ADD CARD",  buttonPressed: {
                print("add card")
            }, isDisabled: .constant(!vm.isFormValied))
        }
        .padding()
    }
}

#Preview {
    PaymentAddCardView()
}
