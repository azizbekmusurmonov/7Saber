//
//  AddCardExtensions.swift
//  Cart
//
//  Created by Ismatillokhon on 31/07/24.
//

import SwiftUI
import AssetKit

public extension String {
    enum CardType {
        case visa
        case mastercard
        case unionPay
        case humo
        case uzcard
        case unknown
        
        var icon: Image {
            switch self {
            case .visa:
                return Asset.Image.Card.visaIcon.swiftUIImage
            case .mastercard:
                return Asset.Image.Card.masterCardIcon.swiftUIImage
            case .unionPay:
                return Asset.Image.Card.unionPayIcon.swiftUIImage
            case .humo:
                return Asset.Image.Card.humoIcon.swiftUIImage
            case .uzcard:
                return Asset.Image.Card.uzcardIcon.swiftUIImage
            case .unknown:
                return Asset.Image.Icons.creditCard.swiftUIImage
            }
        }
        
        var isForiegnCard: Bool {
            self == .mastercard || self == .visa || self == .unionPay
        }
    }
    
    func checkCardNumber() -> CardType? {
        if self.first == "4" {
            return .visa
        } else if self.first == "5" {
            return .mastercard
        }
        if self.prefix(2) == "62" {
            return .unionPay
        }
        else if self.contains("9860") {
            return .humo
        } else if self.contains("8600") {
            return .uzcard
        }
        return isEmpty ? nil : .unknown
    }
    
    var formatExpirationDate: String {
        
        var formattedString = self
        
        // Insert "/" after the second digit
        if self.count == 3, !self.contains("/") {
            formattedString.insert("/", at: self.index(self.startIndex, offsetBy: 2))
        }
        
        // Limit to 5 characters (MM/YY)
        if formattedString.count > 5    {
            formattedString = String(formattedString.prefix(5))
        }
        
        return formattedString
    }
}
