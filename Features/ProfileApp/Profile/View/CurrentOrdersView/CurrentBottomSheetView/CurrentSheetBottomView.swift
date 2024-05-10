//
//  CurrentSheetBottomView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import SwiftUI

struct CurrentSheetBottomView: View {
    var body: some View {
        VStack(spacing: .zero) {
            ScrollView {
                OrderIdView()
                ShipToDataView()
                PaymentItem()
                OrderStatusProgress()
                OrderedProductsView()
            }
        }
        .padding(16)
    }
}

#Preview {
    CurrentSheetBottomView()
}
