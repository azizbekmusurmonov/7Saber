//
//  PaymentItem.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 08/05/24.
//

import SwiftUI
import Core
import AssetKit

struct PaymentItem: View {
    
    @EnvironmentObject var vm: OrdersViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("PAYMENT METHOD")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text("Credit card **9860")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text("TOTAL")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text("2 375 000 UZS")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
            }
            .padding(.vertical, 16)
        }
        Divider()
    }
}

#Preview {
    PaymentItem()
}
