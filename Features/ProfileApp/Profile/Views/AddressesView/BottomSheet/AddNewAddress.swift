//
//  AddLocationSheet.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 13/05/24.
//

import SwiftUI
import Core
import AssetKit

public struct AddNewAddress: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AddressFormViewModel
    @Environment(\.dismiss) var pop
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: .zero) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .frame(width: 36,height: 5)
            
            BottomSheetsNavBar(title: Localizations.addNewAddress)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment:.leading, spacing: 30) {
                    
                    AddressTextfields(titleKey: Localizations.addressName, text: $viewModel.addressName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .padding(.top, 20)
                    
                    SelectCountryTextfield()
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: Localizations.streetAddress, text: $viewModel.streetAddress)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    HStack(spacing: .zero) {
                        AddressTextfields(titleKey: Localizations.building, text: $viewModel.building)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                        AddressTextfields(titleKey: Localizations.apartment, text: $viewModel.apartment)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                    }
                    
                    HStack(spacing: .zero) {
                        AddressTextfields(titleKey: Localizations.floor, text: $viewModel.floor)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                        AddressTextfields(titleKey: Localizations.house, text: $viewModel.house)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                    }
                    
                    AddressTextfields(titleKey: Localizations.city, text: $viewModel.city)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: Localizations.stateProvinceRegion, text: $viewModel.stateProvinceRegion)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: Localizations.zipcode, text: $viewModel.zipcode)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: Localizations.phoneNumber, text: $viewModel.phoneNumber)
                        .keyboardType(.numberPad)
                        .padding()
                }
                .onChange(of: viewModel.message) { newValue in
                    guard let newValue else { return }
                    switch newValue {
                    case .succes(message: let message):
                        Snackbar.show(message: message, theme: .success)
                        pop()
                    case .error(message: let message):
                        Snackbar.show(message: message, theme: .error)
                    }
                }
            }
            
            Divider()
            AddButton(title: "ADD THE ADDRESS", buttonPressed: {
                viewModel.sendAddresses()
            }, isDisabled: .constant(!viewModel.isFormValid)) 
        }
    }
}

#Preview {
    AddNewAddress()
}
