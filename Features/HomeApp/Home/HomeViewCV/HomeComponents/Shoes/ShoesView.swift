//
//  ShoesView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

public struct ShoesView: View {
    @ObservedObject var viewModel = ShoesViewModel()
    
    public var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            contentView
                .padding(.top, -10)
        }
        .padding()
    }
    
    // MARK: - Subviews
    
    private var headerView: some View {
        HStack {
            Text("SHOES")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(.black)
                
            
            Spacer()
            
            Button(action: {
                viewModel.startFetchingData()
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
//            if let error = viewModel.error {
//                errorView(error)
//            } else 
            if let categories = viewModel.categories {
                categoriesView(categories)
            }
        }
    }
    
//    private func errorView(_ error: ShoesNetworkError) -> some View {
//        Text("Error: \(error.localizedDescription)")
//            .foregroundColor(.red)
//            .padding()
//    }
    
    private func categoriesView(_ categories: Shoes) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories.data) { product in
                    ShoesItemView(shoesProduct: product, shoesProductimage: product.mainImg)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}
