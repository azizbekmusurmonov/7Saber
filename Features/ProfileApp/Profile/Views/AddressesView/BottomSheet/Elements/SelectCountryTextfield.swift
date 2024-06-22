//
//  SelectCountryTextfield.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 13/05/24.
//

import SwiftUI
import Core
import AssetKit

struct SelectCountryTextfield: View {
    
    @EnvironmentObject var viewModel: AddressFormViewModel
    
    @State private var showCountryPicker = false
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: 10) {
                VStack(alignment: .leading) {
                    TextField("Select the country", text: viewModel.selectedCountry == nil ? .constant("") : .constant(viewModel.selectedCountry?.name ?? ""))
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
        .sheet(isPresented: $showCountryPicker, content: {
            VStack(spacing: .zero) {
                ScrollView {
                    ForEach(0..<viewModel.countries.count, id: \.self) { index in
                        Button(action: {
                            viewModel.selectedCountry = viewModel.countries[index]
                            showCountryPicker.toggle() // Close the picker after selection
                        }) {
                            Text(viewModel.countries[index].name)
                                .foregroundColor(Color.black)
                        }
                        Divider()
                    }
                }
                .background(Color.white)
            }
        })
    }
}

#Preview {
    SelectCountryTextfield()
}
