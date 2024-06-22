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
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text(item.location)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text(item.seeOnMap)
                        .font(.system(size: 13, weight: .medium))
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

