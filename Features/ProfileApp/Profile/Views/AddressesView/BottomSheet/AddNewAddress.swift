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
    
    var body: some View {
        VStack(spacing: .zero) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .frame(width: 36,height: 5)
            
            BottomSheetsNavBar(title: "ADD NEW ADDRESS")
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack (alignment:.leading,spacing: 30) {
                    
                    
                    AddressTextfields(titleKey: "Address name")
                        .padding()
                        .frame(height: 50)
                    
                    SelectCountryTextfield()
                        .padding()
                        .frame(height: 50)
                    
                    AddressTextfields(titleKey: "Street address")
                        .padding()
                        .frame(height: 50)
                    
                    HStack(spacing: .zero) {
                        AddressTextfields(titleKey: "Building")
                            .keyboardType(.numberPad)
                            .padding()
                            .frame(height: 50)
                        AddressTextfields(titleKey: "Appartment")
                            .keyboardType(.numberPad)
                            .padding()
                            .frame(height: 50)
                    }
                    
                    HStack(spacing: .zero) {
                        AddressTextfields(titleKey: "Floor")
                            .keyboardType(.numberPad)
                            .padding()
                            .frame(height: 50)
                        AddressTextfields(titleKey: "House")
                            .keyboardType(.numberPad)
                            .padding()
                            .frame(height: 50)
                    }
                    
                    AddressTextfields(titleKey: "City")
                        .padding()
                        .frame(height: 50)
                    
                    AddressTextfields(titleKey: "State / Province / Region")
                        .padding()
                        .frame(height: 50)
                    
                    
                    AddressTextfields(titleKey: "Zipcode")
                        .padding()
                        .frame(height: 50)
                    
                    AddressTextfields(titleKey: "Phone number")
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(height: 50)
                }
            }
            
            Divider()
            AddButton(title: "ADD THE ADDRESS") {
                print("add the adress")
            }
        }
    }
}

#Preview {
    AddNewAddress( )
}
