//
//  AddressNameTextfield.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 13/05/24.
//

import SwiftUI
import AssetKit
import Core

struct AddressTextfields: View {
    
    @State var titleKey: String
    @Binding var text: String
    @State var addresNameTapped:Bool = false

    
    var body: some View {
        VStack(spacing: .zero) {
            TextField(titleKey, text: $text)
            Divider()
        }
    }
}

