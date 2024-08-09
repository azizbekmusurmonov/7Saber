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
    
    @EnvironmentObject var vm: OrdersViewModel
    var status: Progresses
    
    private var progressValue: Double {
        switch status {
            
        case .orderedPaid:
            return 0.25
        case .accepted:
            return 0.5
        case .shipped:
            return 0.75
        case .delivired:
            return 1.0
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Localizations.orderStatus)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
           
            ProgressView(value: progressValue, total: 1)
            
            HStack(spacing: 10) {
                Image(uiImage: Asset.Image.Icons.receiptCheck.image)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                VStack(spacing: .zero) {
                    Text(Localizations.orderedPaid)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    Text("08/02/2024 | 12:56")
                        .font(.system(size: 11, weight: .regular))
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 115)
        .background(Asset.Color.Surface.Card.color.swiftUIColor)
        .cornerRadius(10)
        .shadow(radius: 5)
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
