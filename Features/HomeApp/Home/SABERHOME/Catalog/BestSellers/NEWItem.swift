//
//  NEWItem.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//

//import SwiftUI
//
//struct ProductItemView2: View {
//    let product: Product
//    
//    @State private var isButtonScaled = false
//    var body: some View {
//        
//        
//        VStack(alignment: .leading) {
//            AsyncImage(url: product.imageURL) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 225, height: 230)
//                    .padding(.horizontal, 2)
//                    .padding(.top, 10)
//            } placeholder: {
//                ProgressView()
//                    .padding()
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Text(product.name)
//                .font(.system(size: 13))
//                .fontWeight(.medium)
//                .foregroundColor(.black)
//                .padding(.leading, 0)
//                .padding(.top, 55)
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
//                withAnimation {
//                        isButtonScaled.toggle()
//                    }
//            }) {
//                Image("heartt")
//                    .resizable()
//                    .frame(width: 26, height: 28)
//                    .padding(.top, -348)
//                    .padding(.leading, 175)
//                    .padding(0)
//            }
//            .padding(.leading, 10)
//        }
//    }
//}
//
