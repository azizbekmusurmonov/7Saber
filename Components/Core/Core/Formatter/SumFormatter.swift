//
//  SumFormatter.swift
//  Core
//
//  Created by Ismatillokhon on 02/07/24.
//

import Foundation

open class SumTextFormatter: TextFormatter, TextUnformatter, TextNumberFormatter, TextNumberUnformatter {
    // MARK: - Dependencies

    public let numberFormatter: NumberFormatter

    // MARK: - Properties

    open var maximumIntegerCharacters: Int = 14 {
        didSet { numberFormatter.maximumIntegerDigits = maximumIntegerCharacters }
    }
    open var maximumDecimalCharacters: Int {
        return numberFormatter.maximumFractionDigits
    }
    open var prefix: String? {
        guard !numberFormatter.positivePrefix.isEmpty else { return nil }
        return numberFormatter.positivePrefix
    }
    open var suffix: String? {
        guard !numberFormatter.positiveSuffix.isEmpty else { return nil }
        return numberFormatter.positiveSuffix
    }
    open var groupingSeparator: String {
        return numberFormatter.groupingSeparator
    }
    open var decimalSeparator: String {
        return numberFormatter.decimalSeparator
    }
    open var groupingSize: Int {
        return numberFormatter.groupingSize
    }
    private let unformattedDecimalSeparator = "."
    private let negativePrefix = "-"

    // MARK: - Life cycle

    public init(numberFormatter: NumberFormatter) {
        self.numberFormatter = numberFormatter
    }

    // MARK: - TextFormatter

    open func format(_ unformatted: String?) -> String? {
        guard let unformatted = unformatted else { return nil }
        guard !unformatted.isEmpty else { return suffix ?? "" }
        guard unformatted != negativePrefix else { return negativePrefix }

        let correctedUnformatted = correctUnformatted(unformatted, decimalSeparator: unformattedDecimalSeparator)

        let number = NSDecimalNumber(string: correctedUnformatted)
        let isNegative = unformatted.first == "-"
        return (isNegative ? "-" : "") + (numberFormatter.string(from: number) ?? "")
    }

    // MARK: - TextNumberFormatter

    open func format(_ number: NSNumber) -> String? {
        return numberFormatter.string(from: number)
    }

    // MARK: - TextUnformatter

    open func unformat(_ formatted: String?) -> String? {
        guard let formattedString = formatted else { return nil }
        let unformattedString = removeAllFormatSymbols(text: formattedString)
        return unformattedString
    }

    // MARK: - TextNumberUnformatter

    open func unformatNumber(_ formattedText: String?) -> NSNumber? {
        guard let formattedText = formattedText else { return nil }
        return numberFormatter.number(from: formattedText)
    }

    // MARK: - Correct unformatted

    private func correctUnformatted(_ unformatted: String, decimalSeparator: String) -> String {
        return unformatted.replacingOccurrences(of: ",", with: decimalSeparator)
    }

    // MARK: - Remove all format symbols

    func removeAllFormatSymbols(text: String) -> String {
        var resultText = text
        if let prefix = prefix, !prefix.isEmpty {
            for prefixSymbol in prefix {
                resultText = resultText.removePrefix(String(prefixSymbol))
            }
        }
        if let suffix = suffix, !suffix.isEmpty {
            resultText = resultText.replacingOccurrences(of: suffix, with: "")
        }
        resultText = resultText.replacingOccurrences(of: groupingSeparator, with: "")
        return resultText
    }
}

extension String {
    func removePrefix(_ prefix: String) -> String {
        guard !prefix.isEmpty else { return self }
        return sliceAfter(substring: prefix)
    }
    
    func sliceAfter(substring: String) -> String {
        guard self.contains(substring) else { return self }
        guard count > substring.count else { return "" }
        guard let lastSubstringCharacter = substring.last else { return "" }
        guard let substringIndex = firstIndex(of: lastSubstringCharacter) else { return "" }
        let indexAfterSubstringIndex = index(substringIndex, offsetBy: 1)
        return String(self[indexAfterSubstringIndex..<endIndex])
    }
}
