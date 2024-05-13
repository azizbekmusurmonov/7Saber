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
    var body: some View {
        VStack(spacing: .zero) {
            ScrollView {
                VStack {
                    BottomSheetsNavBar(title: "ORDER DETAILS")
                    OrderIdView()
                    ShipToDataView()
                    PaymentItem()
                    OrderedProductsView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    OrderBottomSheetView()
}
