//
//  SelectCountryView.swift
//  OnBording
//
//  Created by Turonboyev Ismatillokhon on 14/05/24.
//

import SwiftUI
import AssetKit

struct SelectCountryView: View {
    
    @State var selection: String = ""
    
    let didChoosedLanguage: (String) -> ()
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack(alignment:.center){
                    Asset.Image.Logo.logoBlack.swiftUIImage
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("SELECT \nTHE COUNTRY")
                        .font(.system(size: 40,weight:.medium))
                        .frame(maxWidth: .infinity)
                }
                
                Picker("", selection: $selection) {
                    ForEach(Languages.allCases, id: \.self) { index in
                        Text(index.rawValue)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .font(.system(size: 23,weight: .medium))
                            .tag(index.rawValue)
                    }
                }
                .pickerStyle(.inline)
                
                Spacer()
                
                Button {
                    guard let locale = Languages(rawValue: selection)?.getLocale else { return }
                    didChoosedLanguage(locale)
                } label: {
                    Capsule()
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .padding(.horizontal,3)
                        .padding(.vertical,5)
                        .foregroundColor(.black)
                        .overlay(
                                Text("CONTINUE")
                                    .font(.system(size: 16,weight: .regular))
                                    .foregroundColor(Color(red: 10, green: 10, blue: 10))
                                    .padding()
                                ,alignment: .center
                        )
                }
                
            }
            .padding()
        .padding()
        }
        
    }
}

#Preview {
    SelectCountryView {_ in 
        
    }
}

enum Languages: String, Hashable, CaseIterable {
    case RUSSIA
    case UZBEKISTAN
    case OTHER
    
    var getLocale: String {
        switch self {
        case .RUSSIA:
            return "ru"
        case .UZBEKISTAN:
            return "uz"
        case .OTHER:
            return "en"
        }
    }
}
