//
//  CardNumberView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 10/05/24.
//

import SwiftUI

struct CardNumberView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack(spacing: .zero) {
            TextField("Enter your card", text: $text)
        }
        Divider()
    }
}
