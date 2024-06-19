//
//  PaymentMethodView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import AssetKit
import Core

struct PaymentMethodView: View {
    
    @EnvironmentObject var vm: PaymentMethodViewModel
    @StateObject var profileData = PaymentMethodViewModel()
    @StateObject private var paymentFromViewModel = PaymentFormViewModel()
    
    @State var isSheetViewActive = false
    @State var detentHeight: CGFloat = 0

    @Environment(\.dismiss) var pop
    
    var body: some View {
        VStack(spacing: .zero) {
           
            navBar
            Spacer()
            if vm.cards.isEmpty {
                PaymentMethodViewIsEmpty()
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: .zero) {
                        ForEach(vm.cards, id: \.self) { card in
                            PaymentMethodItemView(card: card)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                }
            }
            AddButton(title: "ADD PAYMENT METHOD",
                      buttonPressed: {
                self.isSheetViewActive.toggle()
                
            }, isDisabled: $paymentFromViewModel.isFormValied)
            .sheet(isPresented: self.$isSheetViewActive) {
                if #available(iOS 16.0, *) {
                    PaymentAddCardView()
                        .environmentObject(paymentFromViewModel)
                        .readHeight()
                        .onPreferenceChange(HeightPreferenceKey.self) { height in
                            if let height {
                                self.detentHeight = height
                            }
                        }
                        .presentationDetents([.height(self.detentHeight)])
                } else {
                    PaymentAddCardView()
                        .environmentObject(paymentFromViewModel)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension PaymentMethodView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "PAYMENT METHODS ",
                              leftImage: Asset.Image.Navigation.arrowLeftNav.image,
                              leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
    }
}

#Preview {
    PaymentMethodView()
}
