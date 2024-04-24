//
//  NewCollection.swift
//  SABERHOME
//
//  Created by islombek on 30/03/24.
//

import SwiftUI

struct NewCollectionView: View {
 
    @EnvironmentObject var viewModel : NewCollectionController
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("NEW COLLECTION")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.black)
                    .padding(.leading, -10)
                
                Spacer()
                
                Text("SEE ALL")
                    .font(.system(size: 13))
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<viewModel.newCollectionProducts.count, id: \.self) { index in
                        ProductItemView(product: $viewModel.newCollectionProducts[index])
                        
                    }
                }
                .padding(.horizontal, 0)
            }
            .padding(.top, -10)
        }
    }
}
