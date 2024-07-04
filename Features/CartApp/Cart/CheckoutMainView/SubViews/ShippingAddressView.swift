//
//  ShippingAddressView.swift
//  Cart
//
//  Created by Ismatillokhon on 01/07/24.
//

import SwiftUI
import Core
import AssetKit

struct ShippingAddressView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(Localizations.shippingAddress)
                .font(.sabFont(500, size: 16))
            
            Text(Localizations.addShippingAddress)
                .lineLimit(nil)
                .foregroundColor(.init(hex: "#777777"))
                .font(.sabFont(400, size: 13))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: {
                
            }) {
                HStack(spacing: 4) {
                    Text(Localizations.titleAddShipping)
                        .padding(10)
                        .foregroundColor(.white)
                    Image(systemName: "plus.circle")
                        .frame(width: 18.dpWidth(), height: 18.dpHeight())
                        .tint(.white)
                        .padding(10.dpWidth())
                }
            }
            .background(Asset.Color.Button.blackCol.swiftUIColor)
            .clipShape(.capsule)
        }
        .padding(.init(top: 16.dpHeight(), leading: 16.dpWidth(), bottom: 16.dpHeight(), trailing: 16.dpWidth()))
        .background(Color.white)
        .cornerRadius(10.dpWidth())
        
    }
}

#Preview {
    CartView().environmentObject(CartViewModel())
}
