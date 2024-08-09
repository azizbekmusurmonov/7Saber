//
//  NavBar.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import SwiftUI
import AssetKit

public enum CheckoutNavBarType {
    case checkout
    case cart
}

public struct CheckoutNavBar: View {
    // pop
    public let title: String
    public let closeAction: () -> ()
    public let mode: CheckoutNavBarType
    
    public init(title: String, mode: CheckoutNavBarType = .checkout, closeAction: @escaping () -> ()) {
        self.title = title
        self.closeAction = closeAction
        self.mode = mode
    }
    
    public var body: some View {
        HStack {
            Text(title)
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
