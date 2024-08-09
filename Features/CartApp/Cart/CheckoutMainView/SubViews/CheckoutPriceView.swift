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
            if let subtotal = vm.totalBalance?.subtotal, let currency = vm.totalBalance?.currency {
                makeInfoView(title: Localizations.subtotal, price: subtotal, currency: currency)
            }
            if let _ = vm.promocodeObject?.promocode, let promAmount = vm.totalBalance?.promocode, 
                let currency = vm.totalBalance?.currency {
                makeInfoView(title: Localizations.promocodeDiscount, price: promAmount, currency: currency)
            }
            if let shipping = vm.totalBalance?.shipping, let currency = vm.totalBalance?.currency {
                makeInfoView(title: Localizations.shipping, price: shipping, currency: currency)
            }
            if let loyalty = vm.totalBalance?.loyalty, let currency = vm.totalBalance?.currency {
                makeInfoView(title: Localizations.loyaltyDiscount, price: loyalty, currency: currency)
            }
            if let total = vm.totalBalance?.total, let currency = vm.totalBalance?.currency {
                makeInfoView(title: Localizations.total, price: total, currency: currency)
            }
        }.padding(.init(
            top: 12.dpHeight(),
            leading: 26.dpHeight(),
            bottom: 12.dpHeight(),
            trailing: 26.dpHeight())
        )
        .background(Color.white)
        .cornerRadius(10)
    }
    
    func makeInfoView(title: String, price: Double, currency: CurrencyModel) -> some View {
        HStack {
            Text(title)
                .font(.sabFont(400, size: 13))
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            Spacer()
            
            Text(price.moneyFormat(currency: currency.rawValue))
                .font(.sabFont(400, size: 13))
        }
    }
}
