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
    
    var item: OrdersModel
    @EnvironmentObject var vm: OrdersViewModel
    @State private var isTabBottomSheet: IdentifiableInt? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(item.headertitle)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            ForEach(Array(item.cells.enumerated()), id: \.offset) { index, cell in
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
                    .clipShape(Capsule())
                }
                .frame(height: 74)
                .onTapGesture {
                    if isTabBottomSheet?.id == index {
                        isTabBottomSheet = nil
                    } else {
                        isTabBottomSheet = IdentifiableInt(id: index)
                    }
                }
                .sheet(item: self.$isTabBottomSheet) { identifiableInt in
                    OrderBottomSheetView()
                        .environmentObject(CurrentBottomViewModel())
                }
                if index < item.cells.count - 1 {
                    Divider()
                }
            }
        }
        .padding(.horizontal)
    }
}

struct IdentifiableInt: Identifiable {
    var id: Int
}
