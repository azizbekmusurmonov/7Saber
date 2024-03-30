//
//  WishlistAppApp.swift
//  WishlistApp
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Wishlist

@main
struct WishlistAppApp: App {
    
    @StateObject var wishlistVM = WishlistViewModel()
    
    var body: some Scene {
        WindowGroup {
            WishlistView()
                .environmentObject(wishlistVM)
        }
    }
}
