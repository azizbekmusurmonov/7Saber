//
//  PersonSexDataView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 03/05/24.
//

import SwiftUI
import Core
import AssetKit

enum SelectGender: String, CaseIterable, Identifiable {
    case male = "MALE"
    case female = "FEMALE"
    var id: Self { self }
}

struct PersonSexDataView: View {
    
    @State var header = "Sex"
    @State var showOption = false
    @State private var selectGen: SelectGender? = nil
    @State var selectedOption: String?
    
    @EnvironmentObject var vm: PersonalInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(header)
                .font(.system(size: 11, weight: .regular))
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            HStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    
                    TextField(SelectGender.male.rawValue, text: selectGen == nil ? .constant("") : .constant(selectGen!.rawValue))
                        .textFieldStyle(PlainTextFieldStyle())
                        .disabled(true)
                }
                Spacer()
                Button(action: {
                    showOption.toggle()
                }) {
                    Image(uiImage: Asset.Image.Icons.chevronDown.image)
                        .resizable()
                        .frame(width: 10, height: 4.65)
                        .padding(.leading)
                }
            }
            Divider()
        }
        .onTapGesture {
            showOption.toggle()
        }
        .overlay(
            VStack(spacing: .zero) {
                if showOption {
                    
                    VStack {
                        ForEach(SelectGender.allCases, id: \.self) { country in
                            Button(action: {
                                selectGen = country
                                showOption.toggle() // Close the picker after selection
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
                .frame(width: 100)
        )
    }
}
