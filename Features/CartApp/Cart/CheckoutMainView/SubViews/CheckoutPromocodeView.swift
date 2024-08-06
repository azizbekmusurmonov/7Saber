//
//  CheckoutPromocodeView.swift
//  Cart
//
//  Created by Ismatillokhon on 01/07/24.
//

import SwiftUI
import Core
import AssetKit

struct CheckoutPromocodeView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    
    var body: some View {
        HStack {
            Text(Localizations.promocode)
                .font(.sabFont(500, size: 16))
                .padding(16.dpHeight())
            
            Spacer()
            
            if vm.didAppliedPromocode{
                Text(vm.promocode ?? "")
                    .font(.sabFont(400, size: 16))
                    .padding(16.dpHeight())
            } else {
                Button {
                    vm.showPromocode = true
                } label: {
                    Asset.Image.Cart.plusCart.swiftUIImage
                        .resizable()
                        .foregroundColor(Asset.Color.Button.blackCol.swiftUIColor)
                        .frame(width: 24, height: 24)
                        .padding(16.dpHeight())
                }

            }
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}
