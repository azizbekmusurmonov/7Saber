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
    
    @EnvironmentObject var vm: OrderHistoryViewModel
    @StateObject var data = CurrentViewModel()
    
    @State var isTabBottomSheet = false
    
    public init() { }
    
    var body: some View {
        VStack(spacing: 0) {
            navBar
            Spacer()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<vm.orderHistoryData.count, id: \.self) { index in
                        OrderHistorySection(item: vm.orderHistoryData[index])
                    }
                    .onTapGesture {
                        isTabBottomSheet = true
                    }
                    .sheet(isPresented: self.$isTabBottomSheet) {
                        OrderBottomSheetView()
                            .environmentObject(CurrentBottomViewModel())
                    }
                    Divider()
                }
            }
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
