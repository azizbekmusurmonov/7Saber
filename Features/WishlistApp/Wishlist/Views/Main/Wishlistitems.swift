//
//  Wishlistitems.swift
//  
//
//  Created by admin on 4/24/24.
//

import SwiftUI

struct ItemRow: View {
    
    let item: GetWishlistModel
    let selectSizeTapHandler: () -> ()
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.product?.mainImg?.src ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 124.dpWidth(), height: 155.dpHeight())
            } placeholder: {
                ProgressView()
                    .frame(width: 124.dpWidth(), height: 155.dpHeight())
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(item.product?.name ?? "")
                    .font(.system(size: 13))
                
                Text(item.product?.price?.value?.description ?? "")
                    .font(.system(size: 16))
                
                Spacer()
                
                Button(action: selectSizeTapHandler) {
                    Text("Select Size".uppercased())
                        .font(.system(size: 13))
                        .frame(width: 111, height: 40)
                        .padding(.horizontal, 10)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(25)
                        .padding(.top, 30)
                }
            }
            
            Spacer()
        }
        .background(Color.white)
    }
}


