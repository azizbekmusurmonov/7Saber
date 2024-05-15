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
    
    @State var text = ""
    @State var titleKey: String
    @State var addresNameTapped:Bool = false

    
    var body: some View {
        VStack(spacing: .zero) {
            TextField("",text: $text){(status) in
                if status {
                    withAnimation(.easeIn) {
                        addresNameTapped = true
                    }
                }
            }
            .overlay(
                Text(titleKey)
                    .font(.system(size: addresNameTapped ? 11 : 16))
                    .scaleEffect(addresNameTapped ? 0.8 : 1)
                    .offset(x:addresNameTapped ? -7 : 0 ,y: addresNameTapped ? -15 : 0)
                    .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                ,
                alignment: .leading
            )
            Divider()
        }
    }
}

