//
//  View.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

public struct NewCollectionView: View {
    @ObservedObject var viewModel = NewCollectionViewModel()
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("NEW COLLECTION")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.leading, -20)
                
                Spacer()
                
                Button(action: {
                    viewModel.fetchProducts()
                }) {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("SEE ALL")
                            .font(.system(size: 13))
                            .fontWeight(.thin)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            
            if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.newCollectionProducts) { product in
                            ProductItemView(product: product)
                        }
                    }
                    .padding(.horizontal, 0)
                }
                .padding(.top, -10)
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

