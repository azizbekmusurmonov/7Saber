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
        VStack {
            NavigationBar()
            if vm.items.isEmpty {
                WishListIsEmpty()
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(vm.items) { item in
                            ItemRow(item: item)
                            Divider()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
