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
            Divider()
        }
        .frame(width: 100, height: 48)
    }
}
