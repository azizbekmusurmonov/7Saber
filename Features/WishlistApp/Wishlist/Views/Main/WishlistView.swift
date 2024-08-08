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
    
    @StateObject private var wishlistDetailVM = WishlistDetailVM()
    @EnvironmentObject var vm: WishlistViewModel
    
    @State private var presentSheet = false
    @State private var detentHeight: CGFloat = .zero
    
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
                                    presentSheet = true
                                })
                            }
                            Divider()
                        }
                    }
                    .padding()
                }
                .sheet(isPresented: $presentSheet) {
                    if #available(iOS 16.0, *) {
                        WishlistDetailView()
                            .environmentObject(wishlistDetailVM)
                            .readHeight()
                            .onPreferenceChange(HeightPreferenceKey.self) { height in
                                if let height {
                                    detentHeight = height
                                }
                            }
                            .presentationDetents([.height(detentHeight)])
                    } else {
                        WishlistDetailView()
                            .environmentObject(wishlistDetailVM)
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
