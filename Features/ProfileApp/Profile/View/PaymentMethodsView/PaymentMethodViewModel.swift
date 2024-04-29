//
//  PaymentMethodViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI
import Combine
import AssetKit

public class PaymentMethodViewModel: ObservableObject {
    
    @Published public var cards: [Card] = []
    public init() { }
   
}

public struct Card: Hashable {
    public let image: String // Use Image type for image
    public let cardNumber: String
    public var expiryDate: String // Corrected typo in property name
}
