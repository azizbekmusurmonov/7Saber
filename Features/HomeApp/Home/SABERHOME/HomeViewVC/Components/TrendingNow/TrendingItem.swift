//
//  TrendingItem.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//

// TrendingItem.swift
//import SwiftUI
//
//struct TrendingItem: View {
//    let product: TrendProduct
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            AsyncImage(url: product.imageURL) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 325, height: 330)
//                    .padding(.horizontal, 0)
//                    .padding(.top, 0)
//            } placeholder: {
//                ProgressView()
//                    .padding()
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Text(product.name)
//                .font(.system(size: 13))
//                .fontWeight(.medium)
//                .padding(.leading, 0)
//                .foregroundColor(.black)
//                .padding(.top, 80)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .lineLimit(1)
//            
//            Text(product.price)
//                .font(.system(size: 16))
//                .fontWeight(.semibold)
//                .foregroundColor(.black)
//                .padding(.leading, 0)
//                .padding(.top, 2)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .lineLimit(1)
//            
//            Button(action: {
//               
//            }) {
//                Image("plusonImage")
//                    .frame(width: 48, height: 48)
//                    .padding(.top, -120)
//                    .padding(.leading, 0)
//                    .padding(0)
//            }
//            .padding(.leading, 10)
//        }
//    }
//}
