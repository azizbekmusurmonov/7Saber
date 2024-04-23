//
//  WishlistView.swift
//  Wishlist
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI

public struct WishlistView: View {
    
    @EnvironmentObject var vm: WishlistViewModel
    
    public init() { }
    
    public var body: some View {
        ZStack {
            VStack {
                NavigationBar()
                WishListIsEmpty()
                Spacer()
            }
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
