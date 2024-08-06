//
//  CreditCardFormatter.swift
//  Core
//
//  Created by Ismatillokhon on 31/07/24.
//

import Foundation


public class CreditCardFormatter: TextFieldFormatter {
    private var string: String = ""

    public var format: String { "#### #### #### ####" }
    public init() {}

    public func formatted(text: String) -> String {
        let nums = text.replacingOccurrences(of: "[^0-9,*]", with: "", options: .regularExpression)

        string = text
        return format(with: nums)
    }

    private func format(with text: String) -> String {
        var result = ""
        var index = text.startIndex

        for char in format where index < text.endIndex {
            if char == "#" {
                result.append(text[index])
                index = text.index(after: index)
            } else {
                result.append(char)
            }
        }

        return result
    }

    public func formatInput(currentText: String, range: NSRange, replacementString text: String) -> FormattedTextValue? {
        return nil
    }
}
