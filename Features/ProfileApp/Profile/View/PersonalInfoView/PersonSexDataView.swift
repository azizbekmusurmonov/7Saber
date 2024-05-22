//
//  PersonSexDataView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 03/05/24.
//

import SwiftUI
import Core
import AssetKit

struct PersonSexDataView: View {
    
    @State var header = "Sex"
    @State var showOption = false
    @State var data = "None"
    @State var selectedOption: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    Text(header)
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    
                    Text(data)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
                Spacer()
                Button(action: {
                    showOption = true
                }) {
                    Image(uiImage: Asset.Image.Icons.chevronDown.image)
                        .resizable()
                        .frame(width: 10, height: 4.65)
                        .padding(.leading)
                }
            }
            .onTapGesture {
                showOption = true
            }
            .actionSheet(isPresented: $showOption) {
                ActionSheet(
                    title: Text("Choose Sex"),
                    buttons: [
                        .default(Text("Male")) {
                            data = "MALE"
                        },
                        .default(Text("Female")) {
                            data = "FEMALE"
                        },
                    ]
                )
            }
            Divider()
        }
    }
}
