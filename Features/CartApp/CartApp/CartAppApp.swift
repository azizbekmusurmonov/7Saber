//
//  CartAppApp.swift
//  CartApp
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Cart

@main
struct CartAppApp: App {
    
    @StateObject var vm = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            CartView()
                .environmentObject(vm)
        }
    }
}
