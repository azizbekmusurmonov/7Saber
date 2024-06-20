//
//  OrderStatusView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 01/05/24.
//

import SwiftUI
import Core
import AssetKit

struct OrderStatusView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER STATUS")
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
           
            ProgressView(value: 0.25, total: 1) {  }
            
            HStack(spacing: 10) {
                Image(uiImage: Asset.Image.Icons.receiptCheck.image)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                VStack(spacing: .zero) {
                    Text("Ordered & Paid")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text("08/02/2024 | 12:56")
                        .font(.system(size: 11, weight: .regular))
                }
            }
        }
        .padding()
        .frame(height: 115)
        .cornerRadius(10)
    }
}

struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(4)
            .border(.pink, width: 3)
            .cornerRadius(4)
    }
}


#Preview {
    OrderStatusView()
}

