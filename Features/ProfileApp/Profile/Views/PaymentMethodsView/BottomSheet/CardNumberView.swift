//
//  CardNumberView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 10/05/24.
//

import SwiftUI

struct CardNumberView: View {
    
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: .zero) {
            TextField("Enter your card", text: $text)
                .onChange(of: text) { newValue in
                    formatCardNumber(&text)
                }
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.numberPad)
            
            Divider()
                .background(Color.gray)
        }
    }
    
    private func formatCardNumber(_ number: inout String) {
        // Remove any non-digit characters
        let digits = number.filter { $0.isNumber }
        
        // Limit the number of digits to 16
        let limitedDigits = String(digits.prefix(16))
        
        // Group digits into sets of 4
        number = limitedDigits.chunked(into: 4).joined(separator: " ")
    }
}
