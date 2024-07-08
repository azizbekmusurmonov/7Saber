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
        VStack {
            if vm.isLoading {
                ProgressView()
            } else {
                VStack(spacing: .zero) {
                    VStack(spacing: .zero) {
                        CheckoutNavBar(title: Localizations.checkout) {
                            dismiss()
                        }
                        
                        ScrollView {
                            checkoutInfoView
                            priceView
                        }
                    }
                }
                .onDisappear {
                    withAnimation(.spring(duration: 0.3, bounce: 0.3)) {
                        vm.showBagView = false
                    }
                }
                .sheet(isPresented: $vm.showPromocode) {
                    if #available(iOS 16.0, *) {
                        EnterPromocodeView()
                            .environmentObject(vm)
                            .presentationDetents([.height(256.dpHeight())])
                    } else {
                        EnterPromocodeView()
                            .environmentObject(vm)
                    }
                }
            }
        }.onAppear {
            vm.fetchAllData()
        }
    }
}

extension CheckoutMainView {
    private var checkoutInfoView: some View {
        VStack(spacing: 2) {
            BagView()
                .environmentObject(vm)
            
            CheckoutPersonalInfoView()
                .environmentObject(vm)
            
            ShippingAddressView()
                .environmentObject(vm)
            
            CheckoutPromocodeView()
                .environmentObject(vm)
            
        }
        .padding(.horizontal, 20.dpWidth())
        .padding(.vertical, 10.dpHeight())
        .background(Color.init(hex: "#F6F6F6"))
    }
    
    private var priceView: some View {
        VStack(spacing: 0) {
            CheckoutPriceView()
                .environmentObject(vm)
            
            ConfirmButton(
                title: Localizations.continueToPayment, 
                icon: Asset.Image.Icons.arrowRight.swiftUIImage,
                isEnable: $vm.paymentButtonIsEnable
            ) {
                // action
            }
            Spacer()
            
        }.background(Color.white)
    }
}

#Preview {
    CartView().environmentObject(CartViewModel())
}
