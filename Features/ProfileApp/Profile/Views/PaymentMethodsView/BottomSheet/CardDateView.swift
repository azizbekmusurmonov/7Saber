//
//  CardDateView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 10/05/24.
//

import SwiftUI

struct CardDateView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack(spacing: .zero) {
            TextField("MM / YY", text: $text)
                .onChange(of: text) { newValue in
                    formatCardDate(&text)
                }
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.numberPad)

            Divider()
                .background(Color.gray)
        }
        .frame(width: 100, height: 48)
    }
    
    private func formatCardDate(_ number: inout String) {
        // Remove any non-digit characters
        let digits = number.filter { $0.isNumber }
        
        // Limit the number of digits to 4
        let limitedDigits = String(digits.prefix(4))
        
        // Group digits into sets of 4
        number = limitedDigits.chunked(into: 2).joined(separator: " / ")
    }
}
