//
//  CurrentSection.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import SwiftUI
import AssetKit
import Core

struct CurrentSection: View {
    
    var currentItem: CurrentViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(currentItem.headertitle)
                .font(.title)
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            ForEach(currentItem.cell, id: \.self) { cell in
                HStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("ORDER ID")
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        Text(cell.orderId)
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    }
                    VStack(alignment: .leading) {
                        Text("TOTAL")
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                        Text(cell.total)
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    }
                    Spacer()
                    
                    HStack {
                        Text("ON PROCCESS")
                            .font(.footnote)
                            .foregroundColor(Asset.Color.Text.Status.proccessCol.swiftUIColor)
                            .padding(5)
                        
                        Image(uiImage: Asset.Image.Icons.proccess.image)
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                    .background(Asset.Color.Chips.Status.onProccess.swiftUIColor)
                    .clipShape(.capsule)
                    
                }
                .frame(height: 74)
                Divider()
            }
        }
        .padding()
    }
}
