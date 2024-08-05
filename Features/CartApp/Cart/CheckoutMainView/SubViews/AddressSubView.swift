//
//  AddressSubView.swift
//  Cart
//
//  Created by Ismatillokhon on 08/07/24.
//

import SwiftUI
import Core
import AssetKit

struct AddressSubView: View {
    
    let title: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Asset.Image.circleFllIcon.swiftUIImage
                .resizable()
                .frame(width: 24.dpWidth(), height: 24.dpHeight())
            
            Text(title)
                .font(.sabFont(400, size: 16))
        }
    }
}
