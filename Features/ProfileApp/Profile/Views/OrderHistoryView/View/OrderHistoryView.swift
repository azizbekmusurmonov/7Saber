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
    
    @EnvironmentObject var vm: OrdersViewModel
        
    public init() { }
    
    var body: some View {
        
        switch vm.viewState {
        case .show:
            VStack(spacing: 0) {
                navBar
                Spacer()
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<(vm.ordersData?.count ?? 0), id: \.self) { index in
                            if let item = vm.ordersData?[index] {
                                OrderHistorySection(item: item)
                            }
                        }
                        Divider()
                    }
                    .onChange(of: vm.message) { newValue in
                        guard let newValue else { return }
                        switch newValue {
                        case .succes(message: let message):
                            Snackbar.show(message: message, theme: .success)
                        case .error(message: let message):
                            Snackbar.show(message: message, theme: .error)
                        }
                    }
                }
            }
        case .loading:
            LoaderView()
        case .empty:
            navBar
            Spacer()
            OrderHistoryIsEmpty()
        @unknown default:
            fatalError()
        }
        
    }
}


extension OrderHistoryView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "ORDER HISTORY ",
                              leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed: {
                self.pop()
            })
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OrderHistoryView()
}
