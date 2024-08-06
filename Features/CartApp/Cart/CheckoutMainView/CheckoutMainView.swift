//
//  CheckoutMainView.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import SwiftUI
import AssetKit
import Core
import Profile

public struct CheckoutMainView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject var addressVM = AddressFormViewModel()
    
    public init() { }
    
    public var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView()
            } else {
                VStack(spacing: .zero) {
                    VStack(spacing: .zero) {
                        CheckoutNavBar(title: Localizations.checkout) {
                            vm.clearAllData()
                            dismiss()
                        }
                        
                        ScrollView {
                            checkoutInfoView
                            priceView
                        }
                    }
                }
                .navigate(to: CheckoutPaymentView().environmentObject(vm), when: $vm.showPaymentView)
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
                .sheet(isPresented: $vm.showAddressView) {
                    AddNewAddress()
                        .environmentObject(addressVM)
                }
            }
        }.onAppear {
            vm.fetchAllData()
        }
        .onChange(of: addressVM.addedAddress) { selectedAddress in
            guard let selectedAddress else { return }
            vm.selectedAddress = selectedAddress
            vm.paymentButtonIsEnable = true
            vm.checkPrice()
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
            
            ShippingAddressView {
                vm.showAddressView = true
            }
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
                vm.showPaymentView = true
                withAnimation {
                    vm.viewHeight = 470.dpHeight()
                }
            }
            Spacer()
            
        }.background(Color.white)
    }
}

#Preview {
    CartView().environmentObject(CartViewModel())
}
