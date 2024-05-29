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
    
    @State var countryName = ""
    @State var selectCountryTapped:Bool = false
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                TextField("",text: $countryName){(status) in
                    if status {
                        withAnimation(.easeIn) {
                            selectCountryTapped = true
                        }
                    }
                }
                .overlay(
                    Text("Select the country")
                        .font(.system(size: selectCountryTapped ? 11: 16 ))
                        .scaleEffect(selectCountryTapped ? 0.8 : 1)
                        .offset(x:selectCountryTapped ? -7 : 0 ,y: selectCountryTapped ? -15 : 0)
                        .foregroundColor(.gray)
                    ,alignment: .leading
                )
               
            }
            .overlay(
                Picker("",selection: $countryName) {
                    ForEach(NSLocale.isoCountryCodes,id: \.self) { countryCode in
                        Text(Locale.current.localizedString(forRegionCode:  countryCode) ?? "")
                    }
                }
                    .labelsHidden()
                ,alignment: .trailing
            )
            Divider()
        }
    }
}

#Preview {
    SelectCountryTextfield()
}
