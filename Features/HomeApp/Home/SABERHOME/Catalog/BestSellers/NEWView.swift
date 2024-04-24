//
//  NEWView.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//

//import SwiftUI
//
//struct NewCollectionView2: View {
//    let products: [Product]
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Text("NEW COLLECTION")
//                    .font(.system(size: 19, weight: .bold))
//                    .foregroundColor(Color.black)
//                    .padding(.leading, -10)
//                
//                Spacer()
//                
//                Text("SEE ALL")
//                    .font(.system(size: 13))
//                    .fontWeight(.thin)
//                    .foregroundColor(Color.gray)
//            }
//            .padding()
//            
//            ScrollView(.horizontal) {
//                HStack(spacing: 0) {
//                    ForEach(products, id: \.name) { product in
//                        ProductItemView2(product: product)
//                    }
//                }
//                .padding(.horizontal, 0)
//            }
//            .padding(.top, -10)
//        }
//    }
//}
