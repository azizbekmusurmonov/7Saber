//
//  CardsListView.swift
//  Cart
//
//  Created by Ismatillokhon on 05/08/24.
//

import SwiftUI
import AssetKit
import Core

struct CardsListView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    
    @State var mockCards: [String] = ["String", "String", "String"]
    
    @State private var showAddCardView: Bool = false
    
    var body: some View {
        VStack {
            navBar
            
            VStack {
                ForEach(0..<mockCards.count) { index in
                    CardView(isSelected: false, cardNumber: "kfnlckdsncksd", icon: Asset.Image.circleFllIcon.swiftUIImage)
                }
            }.padding(16)
                .frame(width: UIScreen.main.bounds.width - 32)
                .background(Color.init(hex: "#F6F6F6"))

            Spacer()
        }.onAppear {
            vm.getCardsList()
        }
    }
    
    private var navBar: some View {
        HStack {
            Button(action: {
                
            }) {
                Asset.Image.Icons.arrowLeft.swiftUIImage
                    .resizable()
                    .setSize(24)
            }.padding()
            CheckoutNavBar(title: Localizations.addCard) {
                vm.clearAllData()
            }
        }.background(Color.white)
    }
}

#Preview {
    CardsListView().environmentObject(CheckoutMainViewModel())
}

struct CardView: View {
    let isSelected: Bool
    let cardNumber: String
    let icon: Image
    
    
    var body: some View {
        HStack {
            
        }
    }
}
