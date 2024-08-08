//
//  NameCardView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 10/05/24.
//

import SwiftUI
import AssetKit

struct NameCardView: View {
    
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: .zero) {
            TextField("Name of the card", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
        }
        Divider()
    }
}
