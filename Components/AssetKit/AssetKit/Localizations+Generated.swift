// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Localizations {
  /// Enter your phone number or email to continue
  public static let enterYourPhoneOrEmail = Localizations.tr("Localizable_en", "enter_your_phone_or_email", fallback: "Enter your phone number or email to continue")
  /// WELCOME
  public static let welcome = Localizations.tr("Localizable_en", "welcome", fallback: "WELCOME")
  /// Localizable_en.strings
  ///   AssetKit
  /// 
  ///   Created by Ismatillokhon on 19/06/24.
  public static let whereAreYouIn = Localizations.tr("Localizable_en", "where_are_you_in", fallback: "WHERE ARE YOU IN?")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizations {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
