//
//  CheckOutView.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 09/06/24.
//

import SwiftUI
import AssetKit
import Core

struct CheckOutView: View {
    
    @EnvironmentObject var vm: CartViewModel
    @State var action: () -> ()
    
    var body: some View {
        VStack() {
            Divider()
            HStack {
                Text(Localizations.total)
                    .font(.system(size: 16))
                    .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                Spacer()
                Text(MoneyFormatter().formatted(text: vm.overallSum))
                    .font(.system(size: 16))
            }
            Button {
                action()
            } label: {
                HStack() {
                    Text(Localizations.checkout.uppercased())
                        .padding(.leading, 12)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(.trailing, 14)
                }
                .frame(height: 48)
                .foregroundColor(.white)
                .background(Asset.Color.Button.blackCol.swiftUIColor)
                .clipShape(Capsule())
            }
            .padding(.top, 12)
            .padding(.bottom, 17)
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}
