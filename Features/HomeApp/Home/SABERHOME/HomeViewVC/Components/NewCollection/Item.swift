//
//  Item.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//

import SwiftUI

struct ProductItemView: View {
   @Binding var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.image )) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                   
                    .padding(.horizontal, 2)
                    .padding(.top, 10)
            } placeholder: {
                ProgressView()
                    .padding()
            }
            .frame(width: 301, height: 376)
            
            Text(product.title)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.leading, 0)
                .padding(.top, 80)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Text(product.id.description )
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading, 0)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Button(action: {
               
            }) {
                Image("plusonImage")
                    .frame(width: 48, height: 48)
                    .padding(.top, -120)
                    .padding(.leading, 0)
                    .padding(0)
            }
            .padding(.leading, 10)
        }
    }
}

