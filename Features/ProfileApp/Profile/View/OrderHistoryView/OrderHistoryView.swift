//
//  OrderHistoryView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import AssetKit
import Core

struct OrderHistoryView: View {
    
    @Environment(\.dismiss) var pop
//    @State var header: OrderHistoryViewModel
//    @State var cell: Cells
    
    public init() { }
    
    var body: some View {
        VStack(spacing: 0) {
            navBar
            Spacer()
            ScrollView {
                VStack(spacing: 0) {
                    
                }        
            }
        }
    }
}


extension OrderHistoryView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "ORDER HISTORY ", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
    }
}

#Preview {
    OrderHistoryView()
}
