//
//  ShipToDataView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 08/05/24.
//

import SwiftUI
import Core
import AssetKit

struct ShipToDataView: View {
    var body: some View {
        
        HStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: 4) {
                Text("SHIP TO:")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                Text("Muzaffar Nazarov")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                HStack(spacing: .zero) {
                    Image(uiImage: Asset.Image.Icons.location.image)
                        .resizable()
                        .setSize(16)
                    Text("Mirabad st, 22/1, Tashkent, Uzbekistan")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                }
                HStack(spacing: .zero) {
                    Image(uiImage: Asset.Image.Icons.phoneCall01.image)
                        .resizable()
                        .setSize(16)
                    Text("93 456 67 75")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                }
            }.padding(.vertical, 16)
            Spacer()
        }
        Divider()
    }
}

#Preview {
    ShipToDataView()
}
