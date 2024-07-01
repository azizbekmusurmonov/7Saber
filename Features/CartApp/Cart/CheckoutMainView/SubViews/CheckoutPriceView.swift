//
//  CheckoutPriceView.swift
//  Cart
//
//  Created by Ismatillokhon on 01/07/24.
//

import SwiftUI
import Core
import AssetKit

struct CheckoutPriceView: View {
    @EnvironmentObject var vm: CheckoutMainViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.dpHeight()) {
            makeInfoView(title: Localizations.subtotal, price: "5 260 000 UZS")
            makeInfoView(title: Localizations.promocodeDiscount, price: "25 000 UZS")
            makeInfoView(title: Localizations.loyaltyDiscount, price: "45 600 UZS")
            makeInfoView(title: Localizations.estimatedTax, price: "23 000 UZS")
            
        }.padding(.init(
            top: 12.dpHeight(),
            leading: 26.dpHeight(),
            bottom: 12.dpHeight(),
            trailing: 26.dpHeight())
        )
        .background(Color.white)
        .cornerRadius(10)
    }
    
    func makeInfoView(title: String, price: String) -> some View {
        HStack {
            Text(title)
                .font(.sabFont(400, size: 13))
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            Spacer()
            
            Text(title)
                .font(.sabFont(400, size: 13))
        }
    }
}
