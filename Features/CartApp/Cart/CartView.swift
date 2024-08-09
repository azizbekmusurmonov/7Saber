//
//  CartView.swift
//  Cart
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import AssetKit
import Core

public struct CartView: View {
    
    @EnvironmentObject var vm: CartViewModel
    
    @State private var showCheckout: Bool = false
    @State private var showFullSheet: Bool = true
    @State var checkoutViewHeight: CGFloat = 625.dpHeight()
    
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
                
                CheckOutView(action: {
                    withAnimation(.spring(duration: 0.3, bounce: 0.3)) {
                        showCheckout.toggle()
                    }
                })
            }
        }
        .onAppear(perform: {
            vm.getCart()
        })
        .sheet(isPresented: $showCheckout) {
            if #available(iOS 16.0, *) {
                CheckoutMainView(viewHeight: $checkoutViewHeight)
                    .presentationDetents([.height(checkoutViewHeight), .large])
                
            } else {
                CheckoutMainView(viewHeight: .constant(625))
            }
        }
    }
}

#Preview {
    CartView().environmentObject(CartViewModel())
}
