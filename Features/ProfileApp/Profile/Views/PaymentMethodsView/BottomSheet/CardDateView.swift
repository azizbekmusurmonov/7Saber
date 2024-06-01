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
            TextField("** / **", text: $text)
            Divider()
        }
        .frame(width: 100, height: 48)
    }
}
