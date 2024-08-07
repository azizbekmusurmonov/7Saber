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
    
    @EnvironmentObject var vm: OrdersViewModel
    var data: OrdersModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Localizations.orderId)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            HStack(spacing: .zero) {
                VStack(spacing: .zero) {
                    ForEach(data.cells, id: \.self) { cell in
                        Text(cell.orderId)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    }
                }
                Spacer()
                HStack(spacing: .zero) {
                    Image(uiImage: Asset.Image.Icons.clock.image)
                        .resizable()
                        .setSize(16)
                    Text(data.headertitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                }
                Spacer()
                
                HStack {
                    ForEach(data.cells, id: \.self) { cell in
                        Text(cell.status.rawValue.uppercased())
                            .font(.system(size: 11, weight: .regular))
                            .foregroundColor(Asset.Color.Text.Status.proccessCol.swiftUIColor)
                            .padding(5)
                    }
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
