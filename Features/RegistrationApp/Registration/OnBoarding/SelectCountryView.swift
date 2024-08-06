//
//  SelectCountryView.swift
//  OnBording
//
//  Created by Turonboyev Ismatillokhon on 14/05/24.
//

import SwiftUI
import AssetKit
import Core
import NetworkManager

struct SelectCountryView: View {
    
    @State var selection: String = ""
    @State var countries: [CountryModel] = []
    
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
                    ForEach(countries) { country in
                        Text(country.safeName)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .font(.system(size: 23,weight: .medium))
                            .tag(country.safeName)
                    }
                }
                .pickerStyle(.inline)
                
                Spacer()
                
                Button {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        guard !selection.isEmpty else { return }
                        print("Selected country: \(selection)")
                        
                        guard let locale = Languages(rawValue: selection)?.getLocale else {
                            didChoosedLanguage("en")
                            DataStorage.storage.save("en", for: .language)
                            return
                        }
                        DataStorage.storage.save(locale == "ru" ? "ru" : "uz", for: .language)
                        didChoosedLanguage(locale)
                    }
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
            .onAppear {
                getCountries()
            }
            .padding()
        .padding()
        }
    }
    
    private func getCountries() {
        let url = "https://lab.7saber.uz/api/client/country"
        Task.detached {
            
            do {
                let model = try await NetworkService.shared.request(url: url, decode: [CountryModel].self, method: .get)
                
                await MainActor.run {
                    self.countries = model.sorted { $0.nameEn < $1.nameEn }
                }
                
            } catch {
                await MainActor.run {
                    Snackbar.show(message: error.localizedDescription, theme: .error)
                }
            }
        }
    }
}

#Preview {
    SelectCountryView {_ in 
        
    }
}

enum Languages: String, Hashable, CaseIterable {
    case Russia
    case Uzbekistan
    case OTHER
    
    var getLocale: String {
        switch self {
        case .Russia:
            return "ru"
        case .Uzbekistan:
            return "uz"
        case .OTHER:
            return "en"
        }
    }
}
