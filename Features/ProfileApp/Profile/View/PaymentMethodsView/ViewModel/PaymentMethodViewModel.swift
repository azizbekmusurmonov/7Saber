//
//  PaymentMethodViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 15/05/24.
//

import SwiftUI
import Combine
import AssetKit

public class PaymentMethodViewModel: ObservableObject {
    
    public init() {}
    
    @Published var cards: [Card] = [
        Card(image: Asset.Image.BankImage.agrobank.image,
             cardNumber: "8600 23** **** **84",
             expiryDate: "12/27"),
        Card(image: Asset.Image.BankImage.masterCard.image,
             cardNumber: "5623 43** **** **25",
             expiryDate: "12/24")
    ]
}
