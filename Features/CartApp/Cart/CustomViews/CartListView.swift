//
//  CartListView.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 10/06/24.
//

import SwiftUI
import AssetKit

struct CartListView: View {
    
    @EnvironmentObject var vm: CartViewModel
    
    var body: some View {
        ForEach(vm.products) { product in
            HStack(alignment: .top, spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Image(uiImage: Asset.Image.Icons.heartFill.image)
                        .resizable()
                        .frame(width: 124, height: 155)
                    
                    Text("+\(product.count)")
                        .frame(width: 22, height: 22)
                        .font(.system(size: 9))
                        .background(Asset.Color.Button.grayCol.swiftUIColor)
                        .clipShape(Capsule())
                        .padding(.top, 2)
                        .padding(.leading, 2)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text(product.name)
                            .font(.system(size: 13))
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("REMOVE")
                                .font(.system(size: 13))
                                .foregroundColor(Color(red: 255/255, green: 128/255, blue: 128/255))
                        }
                    }
                    HStack(spacing: 0) {
                        Text("\(vm.formattedTotalPrice(product.price * product.count)) UZS")
                            .font(.system(size: 14))
                        
                        Text("\(vm.formattedTotalPrice(product.discountedPrice)) UZS")
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
                            
                            Text(product.size)
                                .font(.system(size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Color:")
                                .font(.system(size: 11))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            
                            Text(product.color)
                                .font(.system(size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        .padding(.leading, 40)
                    }
                    .padding(.top, 21.5)
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            vm.decreaseCount(for: product)
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        .frame(width: 40, height: 40)
                        .background(Asset.Color.Button.grayCol.swiftUIColor)
                        .clipShape(Capsule())
                        
                        Text("\(product.count)")
                            .font(.system(size: 16))
                            .frame(width: 28, height: 28)
                            .padding(.horizontal, 8)
                        
                        Button(action: {
                            vm.increaseCount(for: product)
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
