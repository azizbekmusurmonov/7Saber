//
//  AddLocationSheet.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 13/05/24.
//

import SwiftUI
import Core
import AssetKit

struct AddNewAddress: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AddressFormViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .frame(width: 36,height: 5)
            
            BottomSheetsNavBar(title: "ADD NEW ADDRESS")
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment:.leading, spacing: 30) {
                    
                    AddressTextfields(titleKey: "Address name", text: $viewModel.addressName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .padding(.top, 20)
                    
                    SelectCountryTextfield()
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: "Street address", text: $viewModel.streetAddress)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    HStack(spacing: .zero) {
                        AddressTextfields(titleKey: "Building", text: $viewModel.building)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                        AddressTextfields(titleKey: "Appartment", text: $viewModel.apartment)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                    }
                    
                    HStack(spacing: .zero) {
                        AddressTextfields(titleKey: "Floor", text: $viewModel.floor)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                        AddressTextfields(titleKey: "House", text: $viewModel.house)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                    }
                    
                    AddressTextfields(titleKey: "City", text: $viewModel.city)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: "State / Province / Region", text: $viewModel.stateProvinceRegion)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: "Zipcode", text: $viewModel.zipcode)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    AddressTextfields(titleKey: "Phone number", text: $viewModel.phoneNumber)
                        .keyboardType(.numberPad)
                        .padding()
                }
            }
            
            Divider()
            AddButton(title: "ADD THE ADDRESS", buttonPressed: {
                print("add the address")
            }, isDisabled: .constant(!viewModel.isFormValid)) 
        }
    }
}

#Preview {
    AddNewAddress()
}
