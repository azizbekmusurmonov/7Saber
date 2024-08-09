//
//  File.swift
//  Cart
//
//  Created by Ismatillokhon on 08/08/24.
//

import SwiftUI
import Core
import AssetKit

struct PaymentSuccessView: View {
    
    var body: some View {
        VStack {
            navBar
            Spacer()
        }
    }
    
    private var navBar: some View {
        HStack {
            Asset.Image.Icons.successIcon.swiftUIImage
                .resizable()
                .frame(width: 40.dpWidth(), height: 40.dpHeight())
            
            Text(Localizations.congratulations)
                .font(.sabFont(600, size: 19))
                .foregroundColor(.init(hex: "#009D27"))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            
            Spacer()
            
            Button(action: {

            }) {
                Asset.Image.Wishlist.closeWish.swiftUIImage
                    .frame(width: 40, height: 40)
                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                    .clipShape(.circle)
                    .padding(.horizontal, 16)
            }
        }.padding(.init(top: 20.dpHeight(), leading: 16.dpWidth(), bottom: 20.dpHeight(), trailing: 16.dpWidth()))
        .background(Color.white)
        .frame(height: 80.dpHeight())
    }
    
}


#Preview {
    PaymentSuccessView()
}
