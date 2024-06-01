//
//  OrderIdView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 08/05/24.
//

import SwiftUI
import Core
import AssetKit

struct OrderIdView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER ID")
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            HStack(spacing: .zero) {
                VStack(spacing: .zero) {
                   
                    Text("73489F274")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        
                }
                Spacer()
                HStack(spacing: .zero) {
                    Image(uiImage: Asset.Image.Icons.clock.image)
                        .resizable()
                        .setSize(16)
                    Text("March 20, 2024")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
                Spacer()
                
                HStack {
                    Text("ON PROCCESS")
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(Asset.Color.Text.Status.proccessCol.swiftUIColor)
                        .padding(5)
                    
                    Image(uiImage: Asset.Image.Icons.proccess.image)
                        .resizable()
                        .frame(width: 14, height: 14)
                }
                .background(Asset.Color.Chips.Status.onProccess.swiftUIColor)
                .clipShape(.capsule)
            }
            Divider()
        }.padding(.vertical, 16)
    }
}

#Preview {
    OrderIdView()
}
