//
//  ExtentionToView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 28/05/24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            self.hideKeyboard()
        }
    }
}
