//
//  WishlistView.swift
//  Wishlist
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Core
import AssetKit

public struct WishlistView: View {
    
    @EnvironmentObject var vm: WishlistViewModel
    
    @State private var presentSheet = false
    @State private var detentHeight: CGFloat = .zero
    @State private var selectedItem: GetWishlistModel? = nil
    
    public init() { }
    
    public var body: some View {
        VStack {
            NavigationBar()
            
            if vm.isLoading {
                Spacer()
                ProgressView("Loading products...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                Spacer()
            } else if vm.items.isEmpty {
                WishListIsEmpty()
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Text("\(vm.items.count) products")
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Spacer()
                        }
                        Divider()
                        ForEach(vm.items) { item in
                            HStack(spacing: .zero) {
                                ItemRow(item: item, selectSizeTapHandler: {
                                    selectedItem = item
                                    presentSheet = true
                                })
                            }
                            Divider()
                        }
                    }
                    .padding()
                }
                .sheet(isPresented: $presentSheet) {
                    if let selectedItem = selectedItem {
                        if #available(iOS 16.0, *) {
                            WishlistDetailView(item: selectedItem)
                                .environmentObject(vm)
                                .readHeight()
                                .onPreferenceChange(HeightPreferenceKey.self) { height in
                                    if let height {
                                        detentHeight = height
                                    }
                                }
                                .presentationDetents([.height(detentHeight)])
                        } else {
                            WishlistDetailView(item: selectedItem)
                                .environmentObject(vm)
                        }
                    }
                }
            }
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
