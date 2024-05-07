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
    @StateObject var vm = CurrentModel()
    
    @State var isTabSectionView = false
    @State var detentHeight: CGFloat = 0
    
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
                        if #available(iOS 16.0, *) {
                            CurrentSheetBottomView()
                                .readHeight()
                                .onPreferenceChange(HeightPreferenceKey.self) { height in
                                    if let height {
                                        self.detentHeight = height
                                    }
                                }
                                .presentationDetents([.height(self.detentHeight)])
                        } else {
                            CurrentSheetBottomView()
                        }
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
