//
//  CheckoutPaymentView.swift
//  Cart
//
//  Created by Ismatillokhon on 10/07/24.
//

import SwiftUI
import Core
import AssetKit

enum SelectedPaymentMethod: Int {
    case cash
    case card
}

struct CheckoutPaymentView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vm: CheckoutMainViewModel
    
    var body: some View {
        VStack {
            CheckoutNavBar(title: Localizations.payment) {
                vm.clearAllData()
                dismiss()
            }
            
            selectedPaymentiew
            
            CheckoutPriceView()
                .environmentObject(vm)
            
            ConfirmButton(
                title: Localizations.continueToPayment,
                icon: Asset.Image.Icons.done.swiftUIImage,
                isEnable: $vm.paymentButtonIsEnable
            ) {
                vm.createOrder()
            }
            Spacer()
        }.navigate(to: AddCardView().environmentObject(vm), when: $vm.showAddCardView)
        .background(Color.init(hex: "#F6F6F6"))
    }
}

#Preview {
    CheckoutPaymentView().environmentObject(CheckoutMainViewModel())
}


extension CheckoutPaymentView {
    var selectedPaymentiew: some View {
        VStack(spacing: 4) {
            
            Button(action: {
                withAnimation {
                    vm.selectedPaymentMethod = .card
                    vm.showAddCardView = true
                }
            }) {
                HStack {
                    cardImage
                        .resizable()
                        .frame(width: 24.dpWidth(), height: 24.dpHeight())
                    
                    Text(Localizations.payByCard)
                        .font(.sabFont(500, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    HStack {
                        Text(Localizations.addCard.uppercased())
                            .font(.sabFont(400, size: 13))
                            .padding(.horizontal, 6)
                            .foregroundColor(.black)
                        Asset.Image.Icons.plus.swiftUIImage
                            .resizable()
                            .setSize(18)
                        
                            
                    }
                }
            }
           
            .padding(.init(
                top: 16.dpHeight(),
                leading: 12.dpWidth(),
                bottom: 16.dpHeight(),
                trailing: 12.dpWidth())
            )
            .background(Color.white)
            .cornerRadius(10)
            
            Button(action: {
                withAnimation {
                    vm.selectedPaymentMethod = .cash
                }
            }) {
                HStack {
                    cashImage
                        .resizable()
                        .frame(width: 24.dpWidth(), height: 24.dpHeight())
                    Text(Localizations.payByCash)
                        .font(.sabFont(500, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
            }
            
            .padding(.init(
                top: 16.dpHeight(),
                leading: 12.dpWidth(),
                bottom: 16.dpHeight(),
                trailing: 12.dpWidth())
            )
            .background(Color.white)
            .cornerRadius(10)
        }
            .padding(10)
    }
    
    var cashImage: Image {
        vm.selectedPaymentMethod == .cash
        ? Asset.Image.circleFllIcon.swiftUIImage
        : Asset.Image.Icons.circle.swiftUIImage
    }
    
    var cardImage: Image {
        vm.selectedPaymentMethod == .card
        ? Asset.Image.circleFllIcon.swiftUIImage
        : Asset.Image.Icons.circle.swiftUIImage
    }
}
