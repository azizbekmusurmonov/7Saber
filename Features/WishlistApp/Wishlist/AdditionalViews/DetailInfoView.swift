//
//  DetailInfoView.swift
//  Wishlist
//
//  Created by Ismatillokhon on 5/6/24.
//

import SwiftUI

public struct DetailInfoView: View {
    
    let item: GetWishlistModel
    
    public var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.product?.mainImg?.src ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 124.dpWidth(), height: 155.dpHeight())
            } placeholder: {
                ProgressView()
                    .frame(width: 124.dpWidth(), height: 155.dpHeight())
            }
            
            VStack(alignment: .leading,spacing: 0) {
                Text(item.product?.name ?? "")
                    .font(.system(size: 13))
                
                Text(item.product?.price?.value?.description ?? "")
                    .font(.system(size: 16))
                
                
                Spacer()
            }
            
            Spacer()
        }.background(Color.white)
            .padding(.horizontal, 16)
            .frame(height: 155)
    }
}
