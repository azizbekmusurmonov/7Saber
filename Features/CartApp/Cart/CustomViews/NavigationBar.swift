//
//  NavigationBar.swift
//  CartApp
//
//  Created by Asadbek Yoldoshev on 09/06/24.
//

import SwiftUI
import AssetKit

struct NavigationBar: View {
    
    @EnvironmentObject var vm: CartViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Divider()
                HStack {
                    
                    if !vm.showSearchBar {
                        Image(uiImage: Asset.Image.Logo.logoBlack.image)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                        Divider()
                        Spacer()
                        Text("CART")
                        Spacer()
                    }
                    
                    HStack {
                        
                        if vm.showSearchBar {
                            Image(uiImage: Asset.Image.Logo.logoBlack.image)
                                .resizable()
                                .frame(width: 36, height: 36)
                                .padding(.leading, 12)
                                .padding(.trailing, 12)
                            Divider()
                            Spacer()
                            TextField("Search Cart", text: $vm.searchText)
                            Divider()
                            Button {
                                withAnimation {
                                    vm.showSearchBar.toggle()
                                }
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.trailing, 17)
                            .padding(.leading, 17)
                        } else {
                            Divider()
                            Button {
                                withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                                    vm.showSearchBar.toggle()
                                }
                            } label: {
                                Image(uiImage: Asset.Image.Home.searchHome.image)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.trailing, 17)
                            .padding(.leading, 17)
                        }
                    }
//                    .padding(vm.showSearchBar ? 10 : 0)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(20)
                }
                .frame(height: 60)
                Divider()
            }
            Spacer()
        }
    }
}

#Preview {
    NavigationBar()
}

