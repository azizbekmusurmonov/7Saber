//
//  CheckoutMainView.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import SwiftUI
import AssetKit
import Core

public struct CheckoutMainView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    @Environment(\.dismiss) var dismiss
    
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: .zero) {
            VStack(spacing: .zero) {
                CheckoutNavBar {
                    dismiss()
                }
                
                ScrollView {
                    VStack(spacing: 2) {
                        BagView()
                            .environmentObject(vm)
                        
                        CheckoutPersonalInfoView()
                            .environmentObject(vm)
                        
                        ShippingAddressView()
                            .environmentObject(vm)
                        
                        CheckoutPromocodeView()
                            .environmentObject(vm)
                        
                       
                    }.padding(.horizontal, 20.dpWidth())
                        .padding(.vertical, 10.dpHeight())
                        .background(Asset.Color.Button.grayCol.swiftUIColor)
                    VStack(spacing: 0) {
                        CheckoutPriceView()
                            .environmentObject(vm)
                        
                        CheckoutConfirmButton()
                            .environmentObject(vm)
                        Spacer()
                    }.background(Color.white)
                }
            }
        }
        
        
        .onDisappear {
            withAnimation(.spring(duration: 0.3, bounce: 0.3)) {
                vm.showBagView = false
            }
        }
    }
}

#Preview {
    CartView().environmentObject(CartViewModel())
}
