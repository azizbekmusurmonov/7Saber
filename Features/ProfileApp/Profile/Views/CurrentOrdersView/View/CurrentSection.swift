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
    
    var currentItem: OrdersModel
    
    @State private var pressedIndex: Int? = nil
    @State var isTabSectionView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(currentItem.headertitle)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            ForEach(currentItem.cells.indices, id: \.self) { index in
                let cell = currentItem.cells[index]
                VStack {
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
                            Button(action: {
                                if pressedIndex == index {
                                    pressedIndex = nil
                                } else {
                                    pressedIndex = index
                                }
                            }) {
                                HStack {
                                    Text(cell.status.rawValue.uppercased())
                                        .font(.system(size: 11, weight: .regular))
                                        .foregroundColor(cell.status.textColor)
                                        .padding(5)
                                    
                                    Image(uiImage: cell.status.icon)
                                        .resizable()
                                        .frame(width: 14, height: 14)
                                }
                            }
                        }
                        .background(cell.status.color)
                        .clipShape(Capsule())
                        
                    }
                    .frame(height: 74)
                    .onTapGesture {
                        isTabSectionView = true
                    }
                    .sheet(isPresented: self.$isTabSectionView) {
                        CurrentSheetBottomView()
                            .environmentObject(CurrentBottomViewModel())
                    }
                    if pressedIndex == index {
                        OrderStatusView(status: .orderedPaid)
                    }
                    Divider()
                }
            }
        }
        .padding(.horizontal)
    }
}
