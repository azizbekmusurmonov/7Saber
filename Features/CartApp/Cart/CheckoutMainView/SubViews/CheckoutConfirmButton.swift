//
//  CheckoutConfirmButton.swift
//  Cart
//
//  Created by Ismatillokhon on 02/07/24.
//

import SwiftUI
import Core
import AssetKit

struct CheckoutConfirmButton: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    
    var body: some View {
        Button(action: {
            print("CONTINUE TO PAYMENT PRESSED")
            vm.paymentButtonIsEnable.toggle()
        }) {
            VStack {
                HStack {
                    Text(Localizations.continueToPayment)
                        .foregroundColor(
                            vm.paymentButtonIsEnable
                            ? Asset.Color.Text.whiteCol.swiftUIColor
                            : Asset.Color.Button.grayCol.swiftUIColor
                        )
                        .padding(16)
                    Spacer()
                    Asset.Image.Icons.arrowRight.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(
                            vm.paymentButtonIsEnable
                            ? Asset.Color.Text.whiteCol.swiftUIColor
                            : Asset.Color.Button.grayCol.swiftUIColor
                        )
                        .frame(width: 22.dpWidth(), height: 22.dpHeight())
                        .padding(.trailing, 16)
                }
                .background(
                    vm.paymentButtonIsEnable
                    ? Asset.Color.Button.blackCol.swiftUIColor
                    : .init(hex: "#9E9E9E")
                )
                .clipShape(.capsule)
                .padding(.init(
                    top: 16.dpHeight(),
                    leading: 24.dpWidth(),
                    bottom: 16.dpHeight(),
                    trailing: 24.dpWidth())
                )
            }.background(Color.white)
        }
    }
}
