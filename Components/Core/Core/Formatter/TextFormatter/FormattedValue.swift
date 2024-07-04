//
//  FormattedValue.swift
//  Core
//
//  Created by Ismatillokhon on 02/07/24.
//

import Foundation

public struct FormattedTextValue: Equatable {
  public let formattedText: String
  public let caretBeginOffset: Int

  public init(formattedText: String, caretBeginOffset: Int) {
    self.formattedText = formattedText
    self.caretBeginOffset = caretBeginOffset
  }

  public static var zero: FormattedTextValue {
    return FormattedTextValue(formattedText: "", caretBeginOffset: 0)
  }
}

