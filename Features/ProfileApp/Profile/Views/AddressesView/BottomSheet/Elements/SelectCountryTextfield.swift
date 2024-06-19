//
//  SelectCountryTextfield.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 13/05/24.
//

import SwiftUI
import Core
import AssetKit

enum SelectCountry: String, CaseIterable, Identifiable {
    case uzbekistan = "Uzbekistan"
    case russia = "Russia"
    case other = "Other"
    var id: Self { self }
}

struct SelectCountryTextfield: View {
    
    @EnvironmentObject var viewModel: AddressFormViewModel
    
    @State private var selectedCountry: SelectCountry? = nil
    @State private var showCountryPicker = false
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 10) {
                VStack(alignment: .leading) {
                    TextField("Select the country", text: selectedCountry == nil ? .constant("") : .constant(selectedCountry!.rawValue))
                        .textFieldStyle(PlainTextFieldStyle())
                        .disabled(true)
                }
                Spacer()
                Button(action: {
                    showCountryPicker.toggle()
                }) {
                    Image(uiImage: Asset.Image.Icons.chevronDown.image)
                }
                .padding(.trailing, 16)
            }
            Divider()
        }
        .onTapGesture {
            showCountryPicker = true
        }
        .overlay(
            VStack(spacing: .zero) {
                if showCountryPicker {
                    
                    VStack {
                        ForEach(SelectCountry.allCases, id: \.self) { country in
                            Button(action: {
                                selectedCountry = country
                                showCountryPicker.toggle() // Close the picker after selection
                            }) {
                                Text(country.rawValue)
                                    .foregroundColor(Color.black)
                            }
                            Divider()
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
            }
        )
    }
}

#Preview {
    SelectCountryTextfield()
}
