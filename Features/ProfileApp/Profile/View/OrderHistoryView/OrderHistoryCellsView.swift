//
//  OrderHistoryCellsView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 28/04/24.
//

import SwiftUI
import AssetKit
import Core

struct OrderHistoryCellsView: View {
    
    @State var item: OrderHistoryViewModel
    @State var cells: Cells
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.headertitle)
                .font(.title)
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            HStack(spacing: .zero) {
                VStack(spacing: .zero) {
                    Text("ORDER ID")
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text(cells.orderId)
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
                VStack(spacing: .zero) {
                    Text("TOTAL")
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text(cells.total)
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
                
                Button(action: {
                    
                }) {
                    Text("DELIVERED")
                        .padding()
                        .font(.footnote)
                    
                    Image(uiImage: Asset.Image.Icons.doneGreen.image)
                }
            }
        }
    }
}
