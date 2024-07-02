//
//  CartListView.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 10/06/24.
//

import SwiftUI
import AssetKit
import Core

struct CartListView: View {
    @EnvironmentObject var vm: CartViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(0..<vm.products.count, id: \.self) { index in
                        
                        HStack(alignment: .top, spacing: 0) {
                            ZStack(alignment: .topLeading) {
                                
                                AsyncImage(url: .init(string: vm.products[index].product.mainImg.src)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 124.dpWidth(), height: 155.dpHeight())
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 124.dpWidth(), height: 155.dpHeight())
                                }
                                
                                Text("\(vm.products[index].qty)")
                                    .frame(width: 22, height: 22)
                                    .font(.system(size: 9))
                                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                                    .clipShape(Capsule())
                                    .padding(.top, 2)
                                    .padding(.leading, 2)
                            }
                            
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(spacing: 0) {
                                    Text(vm.products[index].product.name)
                                        .font(.system(size: 13))
                                    Spacer()
                                    Button(action: {
                                        // Remove product action
                                    }) {
                                        Text("REMOVE")
                                            .font(.system(size: 13))
                                            .foregroundColor(.red)
                                    }
                                }
                                HStack(spacing: 0) {
                                    Text(vm.products[index].product.price.display)
                                        .font(.system(size: 14))
                                    
                                    Text(vm.products[index].product.discount.display)
                                        .strikethrough(true, color: Asset.Color.Text.secondaryCol.swiftUIColor)
                                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                                        .font(.system(size: 11))
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                .padding(.top, 4)
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Size:")
                                            .font(.system(size: 11))
                                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                                        
                                        Text(vm.products[index].product.attribute.size)
                                            .font(.system(size: 11))
                                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Color:")
                                            .font(.system(size: 11))
                                            .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                                        
                                        Text("\(vm.products[index].product.name)")
                                            .font(.system(size: 11))
                                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                                    }
                                    .padding(.leading, 40)
                                }
                                .padding(.top, 21.5)
                                
                                HStack(spacing: 0) {
                                    Button(action: {
                                        vm.updateCart(discount: .minus)
                                    }) {
                                        Image(systemName: "minus")
                                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                                    }
                                    .frame(width: 40, height: 40)
                                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                                    .clipShape(Capsule())
                                    
                                    Text("\(vm.products[index].qty)")
                                        .font(.system(size: 16))
                                        .frame(width: 28, height: 28)
                                        .padding(.horizontal, 8)
                                    
                                    Button(action: {
                                        vm.updateCart(discount: .plus)
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                                    }
                                    .frame(width: 40, height: 40)
                                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                                    .clipShape(Capsule())
                                }
                                .padding(.top, 21.5)
                            }
                            .padding(.leading, 10)
                            Spacer()
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        Divider()
                            .padding(.top, 10)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                    }
                }
            }
        }
    }
}
