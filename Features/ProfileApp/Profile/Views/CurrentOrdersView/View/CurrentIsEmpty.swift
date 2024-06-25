//
//  CurrentIsEmpty.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 20/06/24.
//

import SwiftUI
import AssetKit
import Core

struct CurrentIsEmpty: View {
    var body: some View {
        
        VStack(spacing: .zero) {
            Spacer()
            HStack(spacing: .zero) {
                VStack(alignment: .leading) {
                    Image(uiImage: Asset.Image.Icons.clock.image)
                        .resizable()
                        .frame(width: 26.67, height: 26.67)
                    Text("YOU DON’T HAVE CURRENT")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text("Seems you have not added your current yet")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CurrentIsEmpty()
}
