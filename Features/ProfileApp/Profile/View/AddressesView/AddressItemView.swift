//
//  AddressItemView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import Foundation
import SwiftUI
import AssetKit
import Core

struct AddressItemView: View {
    
    var item: Item
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text(item.location)
                        .font(.subheadline)
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text(item.seeOnMap)
                        .font(.title2)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Image(uiImage: Asset.Image.Icons.edit.image)
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                }
            }
        }
    }
}

