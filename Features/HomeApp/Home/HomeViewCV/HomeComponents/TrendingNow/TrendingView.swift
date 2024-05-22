//
//  File.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct TrendingView: View {
    @ObservedObject var viewModel: TrendingViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("TRENDING NOW")
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
                    ForEach(viewModel.trendproducts, id: \.name) { product in
                       
                    }
                }
                .padding(.horizontal, 0)
            }
            .padding(.top, -10)
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}



