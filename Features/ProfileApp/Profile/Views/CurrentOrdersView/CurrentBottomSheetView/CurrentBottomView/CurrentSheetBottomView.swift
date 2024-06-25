//
//  CurrentSheetBottomView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import SwiftUI
import AssetKit
import Core

struct CurrentSheetBottomView: View {
    
    @EnvironmentObject var vm: OrdersViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            BottomSheetsNavBar(title: "ORDER DETAILS")
            ScrollView {
//                OrderIdView()
//                    .environmentObject(OrdersViewModel())
                ShipToDataView()
                    .environmentObject(OrdersViewModel())
                PaymentItem()
                    .environmentObject(OrdersViewModel())
                OrderStatusProgress()
                    .environmentObject(OrdersViewModel())
                OrderedProductsView()
                    .environmentObject(OrdersViewModel())
            }
            .padding(16)
        }
    }
}

#Preview {
    CurrentSheetBottomView()
}
