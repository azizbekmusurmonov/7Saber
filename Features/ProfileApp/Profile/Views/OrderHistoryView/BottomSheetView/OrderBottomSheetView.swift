//
//  OrderBottomSheetView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import SwiftUI
import Core
import AssetKit

struct OrderBottomSheetView: View {
    
    @EnvironmentObject var vm: OrdersViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            BottomSheetsNavBar(title: Localizations.orderDetails)
            ScrollView {
//                    OrderIdView()
                    ShipToDataView()
                    PaymentItem()
                    OrderedProductsView()
            }
            .padding()
        }
    }
}

#Preview {
    OrderBottomSheetView()
}
