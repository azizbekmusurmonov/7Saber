//
//  TextFieldMaxLenth.swift
//  Core
//
//  Created by Ismatillokhon on 03/07/24.
//

import SwiftUI

// Step 1: Create a Custom Binding
public extension Binding where Value == String {
    func maxLength(_ length: Int) -> Binding<String> {
        return Binding<String>(
            get: {
                return self.wrappedValue
            },
            set: { newValue in
                if newValue.count <= length {
                    self.wrappedValue = newValue
                } else {
                    self.wrappedValue = String(newValue.prefix(length))
                }
            }
        )
    }
}

