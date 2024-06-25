//
//  PaymentMethodViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI

public struct Card: Hashable {
    public var id = UUID().uuidString
    public let image: UIImage // Use Image type for image
    public let cardNumber: String
    public var expiryDate: String // Corrected typo in property name
}
