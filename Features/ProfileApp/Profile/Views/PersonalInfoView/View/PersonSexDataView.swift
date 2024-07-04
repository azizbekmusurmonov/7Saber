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
    
    @EnvironmentObject var vm: PersonalInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(header)
                .font(.system(size: 11, weight: .regular))
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            HStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    TextField("Gender", text: .constant(vm.selectGender?.rawValue ?? ""))
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
                }
                .padding(.trailing, 10)
            }
            Divider()
        }
        .onTapGesture {
            showOption = true
        }
        .overlay(
            VStack(spacing: .zero) {
                if showOption {
                    VStack {
                        ForEach(SelectGender.allCases) { gender in
                            Button(action: {
                                vm.selectGender = gender
                                showOption.toggle() // Close the picker after selection
                            }) {
                                Text(gender.rawValue)
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
