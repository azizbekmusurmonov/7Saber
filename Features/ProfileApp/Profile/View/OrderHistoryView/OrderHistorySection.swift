//
//  OrderHistoryCellsView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 28/04/24.
//

import SwiftUI
import AssetKit
import Core

struct OrderHistorySection: View {
    
    var item: OrderHistoryModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.headertitle)
                .font(.title)
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            ForEach(item.cells, id: \.self) { cell in
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("ORDER ID")
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        Text(cell.orderId)
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    }
                    VStack(alignment: .leading) {
                        Text("TOTAL")
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        Text(cell.total)
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    }
                    Spacer()
                    
                    
                    
                    
                    HStack {
                        Text(cell.status.rawValue.uppercased())
                            .font(.footnote)
                            .foregroundColor(.white)
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
                    .padding()
            }
        }
        .padding()
    }
}