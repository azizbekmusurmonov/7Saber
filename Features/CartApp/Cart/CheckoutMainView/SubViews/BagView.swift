//
//  BagView.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import SwiftUI
import AssetKit
import Core

struct BagView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("In your bag (6 products)")
                    .font(.sabFont(500, size: 16))
                    .padding(16.dpHeight())
                Spacer()
                
                Button(action: {
                    withAnimation(.spring(duration: 0.3, bounce: 0.3)) {
                        vm.showBagView.toggle()
                    }
                }) {
                    ShowHideIcon
                        .resizable()
                        .setSize(24.dpHeight())
                        .padding(16.dpHeight())
                }
            }
            if vm.showBagView {
                productsView
                    .opacity(vm.showBagView ? 1 : 0)
            }
            
        }.background(Color.white)
            .cornerRadius(10.dpWidth())
            .clipped()
    }
    
    var ShowHideIcon: Image {
        vm.showBagView
        ? Asset.Image.Checkout.chevronUp.swiftUIImage
        : Asset.Image.Checkout.chevronDown.swiftUIImage
    }
    
    var productsView: some View {
        VStack{
            
            ForEach(0..<5) { _ in
                VStack {
                    ProductView(product: CartMockData.productViewMock)
                        .measureContentSize()
                }
            }
            
        }
    }
}

#Preview {
    CartView().environmentObject(CartViewModel())
}
