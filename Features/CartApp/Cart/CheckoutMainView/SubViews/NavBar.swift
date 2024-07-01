//
//  NavBar.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import SwiftUI
import Core
import AssetKit

struct CheckoutNavBar: View {
    // pop
    let closeAction: () -> ()
    var body: some View {
        HStack {
            Text("Checkout")
                .font(.sabFont(600, size: 19))
                .fontWeight(.bold)
                .padding(.leading, 16)
                .padding(.vertical, 28)
            
            Spacer()
            
            Button(action: {
                closeAction()
            }) {
                Asset.Image.Wishlist.closeWish.swiftUIImage
                    .frame(width: 40, height: 40)
                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                    .clipShape(.circle)
                    .padding(.horizontal, 16)
                
            }
        }.cornerRadius(10)
        .background(Color.white)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutNavBar {}
            .previewLayout(.sizeThatFits)
    }
}
