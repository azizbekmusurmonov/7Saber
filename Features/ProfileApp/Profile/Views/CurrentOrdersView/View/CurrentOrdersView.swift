//
//  CurrentOrdersView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import AssetKit
import Core

struct CurrentOrdersView: View {
    
    @Environment(\.dismiss) var pop
    
    @EnvironmentObject var vm: CurrentViewModel
    @StateObject var data = CurrentViewModel()
    
    @State var isTabSectionView = false
    
    public init() { }
    
    var body: some View {
        VStack(spacing: 0) {
            navBar
            Spacer()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<vm.currentData.count, id: \.self) { index in
                        CurrentSection(currentItem: vm.currentData[index])
                    }
                    .onTapGesture {
                        isTabSectionView = true
                    }
                    .sheet(isPresented: self.$isTabSectionView) {
                        CurrentSheetBottomView()
                            .environmentObject(CurrentBottomViewModel())
                    }
                    Divider()
                }
            }
        }
    }
}

extension CurrentOrdersView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "MY ORDERS ",
                              leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CurrentOrdersView()
}
