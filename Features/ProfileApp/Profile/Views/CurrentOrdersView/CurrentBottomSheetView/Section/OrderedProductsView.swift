//
//  OrderedProductsView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 09/05/24.
//

import SwiftUI
import Core
import AssetKit

struct OrderedProductsView: View {
    
    @EnvironmentObject var vm: OrdersViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack(spacing: .zero) {
                Text(Localizations.orderedProducts)
                    .font(.sabFont(600, size: 19))
                    .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                Text("(\(vm.products?.count ?? 0) items)")
                    .font(.sabFont(600, size: 19))
                    .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            }
           
            if let products = vm.products {
                ForEach(products, id: \.self) { product in
                    OrderedItem(product: product,
                                buttonPressed: {
                        print("Button pressed for \(product.productName)")
                    })
                    Divider()
                }
                .padding()
            } 
        }
    }
}

#Preview {
    OrderedProductsView()
}
