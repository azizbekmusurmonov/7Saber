//
//  CatdCvvView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 10/05/24.
//

import SwiftUI

struct CardCvvView: View {
    
    @State var textCvv = ""
    
    var body: some View {
        VStack(spacing: .zero) {
            TextField("CVV", text: $textCvv)
                .onChange(of: textCvv) { newValue in
                    formatCardCvv(&textCvv)
                }
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.numberPad)
            Divider()
        }
        .frame(width: 100, height: 48)
    }
    
    private func formatCardCvv(_ number: inout String) {
        // Remove any non-digit characters
        let digits = number.filter { $0.isNumber }
        
        // Limit the number of digits to 3
        let limitedDigits = String(digits.prefix(3))
        
        // Group digits into sets of 4
        number = limitedDigits.chunked(into: 3).joined(separator: "")
    }
}
