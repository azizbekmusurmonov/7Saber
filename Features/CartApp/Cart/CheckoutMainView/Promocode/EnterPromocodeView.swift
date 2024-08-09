//
//  EnterPromocodeView.swift
//  Cart
//
//  Created by Ismatillokhon on 03/07/24.
//

import SwiftUI
import AssetKit
import Core

struct EnterPromocodeView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24.dpHeight()) {
            CheckoutNavBar(title: Localizations.promocode) {
                vm.showPromocode = false
            }
            
            VStack(alignment: .leading, spacing: 8.dpHeight()) {
                Text(Localizations.addPromocodeHere)
                    .font(.sabFont(500, size: 11))
                    .foregroundColor(.init(hex: "#777777"))
                
                HStack {
                    TextField("", text: $vm.promocode)
                        .focused($isFocused)
                        if !vm.promocode.isEmpty {
                            Button {
                                vm.promocode = ""
                            }label: {
                                Asset.Image.Icons.closeRed.swiftUIImage
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.black)
                                    .frame(width: 24.dpWidth(), height: 24.dpHeight())
                                    
                            }
                            .padding(.trailing, 10)
                        }
                }.font(.sabFont(500, size: 16))
                    .onChange(of: vm.promocode) { newValue in
                        if newValue.count > 1 {
                            vm.promocodeIsEnable = true
                        }
                    }
                Divider()
                
            }.padding(.horizontal, 16.dpWidth())
            
            ConfirmButton(
                title: Localizations.applyPromocode,
                icon: Asset.Image.Icons.whiteCheck.swiftUIImage,
                isEnable: $vm.promocodeIsEnable
            ) {
                vm.didApplyPromocode()
            }
        }
        .background(Color.init(hex: "#F6F6F6"))
        .onDisappear {
            vm.showPromocode = false
        }
        .onAppear {
            isFocused = true
        }
    }
}

#Preview {
    EnterPromocodeView().environmentObject(CheckoutMainViewModel())
        
}
