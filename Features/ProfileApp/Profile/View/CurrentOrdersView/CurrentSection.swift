//
//  CurrentSection.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import SwiftUI
import AssetKit
import Core

struct CurrentSection: View {
    
    var currentItem: CurrentModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(currentItem.headertitle)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            ForEach(currentItem.cell, id: \.self) { cell in
                HStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("ORDER ID")
                            .font(.system(size: 11, weight: .regular))
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        Text(cell.orderId)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    }
                    VStack(alignment: .leading) {
                        Text("TOTAL")
                            .font(.system(size: 11, weight: .regular))
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        Text(cell.total)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    }
                    Spacer()
                    
                    HStack {
                        Text(cell.status.rawValue.uppercased())
                            .font(.system(size: 11, weight: .regular))
                            .foregroundColor(cell.status.textColor)
                            .padding(5)
                        
                        Image(uiImage: cell.status.icon)
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                    .background(cell.status.color)
                    .clipShape(.capsule)
                    
                }
                .frame(height: 74)
                Divider()
            }
        }
        .padding(.horizontal)
    }
}
