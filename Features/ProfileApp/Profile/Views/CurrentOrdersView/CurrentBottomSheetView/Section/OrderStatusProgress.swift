//
//  OrderStatusProgress.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 08/05/24.
//

import SwiftUI
import Core
import AssetKit

struct OrderStatusProgress: View {
    
    @EnvironmentObject var vm: OrdersViewModel
    
    @State private var progress: Double = 0.25
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(Localizations.orderStatus)
                .font(.system(size: 19, weight: .semibold))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            HStack(spacing: 16) {
                ProgressView(value: progress)
                    .progressViewStyle(VerticalProgressViewStyle())
                    .frame(width: 10, height: 210)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Image(uiImage: Asset.Image.Icons.receiptCheck.image)
                            .resizable()
                            .setSize(24)
                        Text(Localizations.orderedPaid)
                            .font(.sabFont(500, size: 13))
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        if progress == 0.25 {
                            Text("08/02/2024 | 12:56")
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Image(uiImage: Asset.Image.Icons.checkCircleBroken.image)
                            .resizable()
                            .setSize(24)
                        Text(Localizations.accepted)
                            .font(.sabFont(500, size: 13))
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        if progress == 0.5 {
                            Text("08/02/2024 | 12:56")
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Image(uiImage: Asset.Image.Icons.fastShopping.image)
                            .resizable()
                            .setSize(24)
                        Text(Localizations.shipped)
                            .font(.sabFont(500, size: 13))
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        if progress == 0.75 {
                            Text("08/02/2024 | 12:56")
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Image(uiImage: Asset.Image.Icons.done.image)
                            .resizable()
                            .setSize(20)
                        Text(Localizations.delivered)
                            .font(.sabFont(500, size: 13))
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        if progress == 1.0 {
                            Text("08/02/2024 | 12:56")
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        }
                    }
                }
                Spacer()
            }
        }
        Divider()
        //        .padding(16)
        
    }
}

#Preview {
    OrderStatusProgress()
}
