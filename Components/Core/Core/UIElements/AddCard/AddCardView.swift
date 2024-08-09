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
                
                cardNameTextField
                
                HStack {
                    expiredDateField
                    Spacer()
                    cvvField
                }
            }
            .padding(16.dpHeight())
            .frame(width: UIScreen.main.bounds.width - 32, height: 230.dpHeight())
            .cornerRadius(10)
            .background(Color.white)
            .border(Color.init(uiColor: .systemGray5))
            
            
            VStack(spacing: .zero) {
                Button(action: {
                    
                }) {
                    ZStack {
                        Capsule()
                            .foregroundColor(vm.canAddCard ? .black : .gray)
                            
                            .frame(height: 56.dpHeight())
                        
                        Text(Localizations.addCard)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 16.dpHeight())
                .padding(.vertical, 12.dpHeight())
            }
            .background(Color.white)
           
            
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
                    .setSize(24.dpHeight())
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
                .frame(width: 36.dpWidth(), height: 36.dpHeight(), alignment: .leading)
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
    
    private var cardNameTextField: some View {
        VStack {
            TextField(Localizations.nameOfTheCard, text: $vm.enteredCardName)

            Divider()
                .background(Color.init(
                    uiColor: vm.enteredCardName.isEmpty ? .systemGray5 : .black)
                )
        }
        .onChange(of: vm.enteredExpiredDate) { newValue in
            vm.enteredExpiredDate = newValue.formatExpirationDate
            checkState()
        }
        .padding(.top, 20.dpHeight())
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
        .padding(.top, 20.dpHeight())
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
        .frame(width: 100.dpHeight())
        .onChange(of: vm.enteredCVV) { newValue in
            vm.enteredCVV = String(newValue.prefix(3))
            checkState()
        }
        .padding(.top, 20.dpHeight())
        .opacity(vm.selctedCardType?.isForiegnCard == true ? 1 : 0)
    }
    
    func checkState() {
        guard let type = vm.enteredCardNumber.checkCardNumber() else { return }
       
        if type.isForiegnCard {
            vm.canAddCard = vm.enteredCardNumber.count > 15 && !vm.enteredCardName.isEmpty 
            && vm.enteredExpiredDate.count == 5 && vm.enteredCVV.count == 3
        } else {
            vm.canAddCard = vm.enteredCardNumber.count > 15 && !vm.enteredCardName.isEmpty && vm.enteredExpiredDate.count == 5
        }
    }
}

#Preview {
    AddCardView {
        
    } pop: {
        
    }

}
