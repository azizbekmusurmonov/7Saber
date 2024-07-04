//
//  MoneyFormatter.swift
//  Core
//
//  Created by Ismatillokhon on 02/07/24.
//

import Foundation

public class MoneyFormatter: TextFieldFormatter {
    // Don't modify format for money
    public var format: String = ""
    public init() {}

    public func formatted(text: String) -> String {
        guard let formatted = text.currencyInputFormatting() else { return text }
        return formatted
    }

    public func formatted(text: String, with currency: String) -> String {
        guard let formatted = text.currencyInputFormatting() else { return text }
        return "\(formatted) \(currency)"
    }
}

public extension Double {
    var realBalance: Float {
        Float(self) / 100
    }
    
    func moneyFormat(currency: String) -> String {
        let formatted = MoneyFormatter().formatted(text: realBalance.description)
        return "\(formatted) \(currency)"
    }
}

public extension String {
    func currencyInputFormatting() -> String? {
        if let formattedString = SumTextFormatter(numberFormatter: .money).format(self) {
            return formattedString.replacingOccurrences(of: "\u{00A0}", with: " ")
        } else {
            return ""
        }
    }
}

public protocol TextFieldValidator {
    func isValid(text: String) -> Bool
}

public protocol TextFieldFormatter {
    var format: String {get}

    // gets string and returns formatted string
    func formatted(text: String) -> String

    func formatInput(currentText: String, range: NSRange, replacementString text: String) -> FormattedTextValue?
}

public extension TextFieldFormatter {
    func formatInput(currentText: String, range: NSRange, replacementString text: String) -> FormattedTextValue? {
        fatalError("Not implemented")
    }
}

