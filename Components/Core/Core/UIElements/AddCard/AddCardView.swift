//
//  AddCardView.swift
//  Cart
//
//  Created by Ismatillokhon on 30/07/24.
//

import SwiftUI
import AssetKit

public struct AddCardView: View {
    
    @StateObject var vm = AddCardViewModule()
    public let dismiss: () -> ()
    public let pop: () -> ()
    
    public init(dismiss: @escaping () -> Void, pop: @escaping () -> Void) {
        self.dismiss = dismiss
        self.pop = pop
    }
    
    public var body: some View {
        VStack {
            navBar
            VStack(alignment: .leading) {
                cardLogoImage
                Spacer()
                cardNumberField
                
                HStack {
                    expiredDateField
                    Spacer()
                    cvvField
                }
            }
            .padding(16)
            .frame(width: UIScreen.main.bounds.width - 32, height: 200.dpHeight())
            .background(Color.white)
            .border(Color.init(uiColor: .systemGray5))
            .cornerRadius(10)
            
            Button(action: {
                
            }) {
                ZStack {
                    Capsule()
                        .foregroundColor(vm.canAddCard ? .black : .gray)
                        
                        .frame(height: 56)
                    
                    Text(Localizations.addCard)
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
           
            
            Spacer()
        }.background(Color.init(hex: "#F6F6F6"))
    }
    
    private var navBar: some View {
        HStack {
            Button(action: {
                pop()
            }) {
                Asset.Image.Icons.arrowLeft.swiftUIImage
                    .resizable()
                    .setSize(24)
            }.padding()
            CheckoutNavBar(title: Localizations.addCard) {
                dismiss()
            }
        }.background(Color.white)
    }
    
    private var cardLogoImage: some View {
        VStack {
            vm.selctedCardType?.icon
                .resizable()
                .frame(width: 36, height: 36, alignment: .leading)
                .padding(.leading, 4)
        }
    }
    
    private var cardNumberField: some View {
        VStack {
            TextField(Localizations.cardNumber, text: $vm.enteredCardNumber)
                .keyboardType(.numberPad)
            Divider()
                .background(Color.init(
                    uiColor: vm.enteredCardNumber.isEmpty ? .systemGray5 : .black)
                )
        }.onChange(of: vm.enteredCardNumber) { newValue in
            vm.selctedCardType = newValue.checkCardNumber()
            vm.enteredCardNumber =  CreditCardFormatter().formatted(text: newValue)
            checkState()
        }
    }
    
    private var expiredDateField: some View {
        VStack {
            TextField(Localizations.mmyy, text: $vm.enteredExpiredDate)
                .keyboardType(.numberPad)
            Divider()
                .background(Color.init(
                    uiColor: vm.enteredCardNumber.isEmpty ? .systemGray5 : .black)
                )
        }
        .frame(width: 66)
        .onChange(of: vm.enteredExpiredDate) { newValue in
            vm.enteredExpiredDate = newValue.formatExpirationDate
            checkState()
        }
    }
    
    private var cvvField: some View {
        VStack {
            TextField("CVV", text: $vm.enteredCVV)
                .keyboardType(.numberPad)
            Divider()
                .background(Color.init(
                    uiColor: vm.enteredCVV.isEmpty ? .systemGray5 : .black)
                )
        }
        .frame(width: 100)
        .onChange(of: vm.enteredCVV) { newValue in
            vm.enteredCVV = String(newValue.prefix(3))
            checkState()
        }
        .opacity(vm.selctedCardType?.isForiegnCard == true ? 1 : 0)
    }
    
    func checkState() {
        vm.canAddCard = vm.enteredCardNumber.count > 15 && vm.enteredExpiredDate.count == 5
        //&& (vm.selctedCardType?.isForiegnCard == true && vm.enteredCVV.count == 3)
    }
}
