//
//  NameCardView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 10/05/24.
//

import SwiftUI

struct NameCardView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack(spacing: .zero) {
            TextField("Name of the card", text: $text)
        }
        Divider()
    }
}
