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
    var action: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(Localizations.shippingAddress)
                    .font(.sabFont(500, size: 16))
                
                
                
                if let addressess = vm.selectedAddress,
                   let name = addressess.name,
                   let city = addressess.city,
                   let building = addressess.building,
                   let appartment = addressess.appartment,
                   let countryID = addressess.countryId
                {
                    AddressSubView(title: name.addDot + building + "/" + appartment.addDot + city.addDot + countryID)
                } else {
                    Text(Localizations.addShippingAddress)
                        .lineLimit(nil)
                        .foregroundColor(.init(hex: "#777777"))
                        .font(.sabFont(400, size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Button(action: {
                    action()
                }) {
                    HStack(spacing: 4) {
                        Text(vm.selectedAddress == nil ? Localizations.titleAddShipping : Localizations.addNewAddress)
                            .padding(10)
                            .foregroundColor(vm.selectedAddress == nil ? .white : .black)
                        Image(systemName:  "plus.circle")
                            .frame(width: 18.dpWidth(), height: 18.dpHeight())
                            .tint(vm.selectedAddress == nil ? .white : .black)
                            .padding(10.dpWidth())
                    }
                }
                .background(vm.selectedAddress == nil ? Asset.Color.Button.blackCol.swiftUIColor : Asset.Color.Button.grayCol.swiftUIColor)
                .clipShape(.capsule)
            }
            
            Spacer()
        }
        .padding(.init(top: 16.dpHeight(), leading: 16.dpWidth(), bottom: 16.dpHeight(), trailing: 16.dpWidth()))
        .background(Color.white)
        .cornerRadius(10.dpWidth())
    }
}

#Preview {
    CartView().environmentObject(CartViewModel())
}

extension String {
    var addDot: String {
        self + " "
    }
}
