//
//  File.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

public struct TrendingView: View {
    @ObservedObject var viewModel = TrendingViewModel()
    
    public var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            contentView
                .padding(.top, -10)
        }
        .onAppear {
            viewModel.fetchCategories()
        }
        .padding()
    }
    
    // MARK: - Subviews
    
    private var headerView: some View {
        HStack {
            Text("TRENDING NOW")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(.black)
                
            
            Spacer()
            
            Button(action: {
                viewModel.fetchCategories()
            }) {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("SEE ALL")
                        .font(.system(size: 13, weight: .thin))
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private var contentView: some View {
        Group {
            if let error = viewModel.error {
                errorView(error)
            } else if let categories = viewModel.categories {
                categoriesView(categories)
            }
        }
    }
    
    private func errorView(_ error: TrendingNetworkError) -> some View {
        Text("Error: \(error.localizedDescription)")
            .foregroundColor(.red)
            .padding()
    }
    
    private func categoriesView(_ categories: Trending) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories.data) { product in
                    TrendingItemView(trendingProduct: product, trendingProductimage: product.mainImg)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}
