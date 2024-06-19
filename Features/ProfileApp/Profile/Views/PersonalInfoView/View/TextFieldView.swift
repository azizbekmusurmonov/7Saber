//
//  TextFieldView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 03/05/24.
//

import SwiftUI
import AssetKit
import Core

struct TextFieldView: View {
    
    @State var header: String
    @State var titleKey: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.system(size: 11, weight: .regular))
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            TextField(titleKey, text: $text)
            Divider()
        }
    }
}
