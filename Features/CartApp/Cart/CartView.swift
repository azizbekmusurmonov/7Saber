//
//  CartView.swift
//  Cart
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import AssetKit

public struct CartView: View {
    
    @EnvironmentObject var vm: CartViewModel
    
    public init() { }
    
    public var body: some View {
        VStack {
            NavigationBar()
            Spacer()
            if vm.products.isEmpty {
                CartIsEmpty()
                Spacer()
            } else {
                    CartListView()
                
                CheckOutView(action: {})
            }
            
        }
    }
}
