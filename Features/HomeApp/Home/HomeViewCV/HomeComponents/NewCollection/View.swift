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
            headerView
            contentView
                
        }
        .onAppear {
            viewModel.startFetchingData()
        }
        .padding()
    }
    
    // MARK: - Subviews
    
    private var headerView: some View {
        HStack {
            Text("NEW COLLECTION")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
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
            switch viewModel.newCollection {
            case .some(let collection):
                collectionView(collection)
            case .none:
                noDataView
            }
        }
    }

    private var noDataView: some View {
        Text("No data available.")
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding()
    }
    

    private func collectionView(_ collection: NewCollection) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(collection.data) { product in
                    ProductItemView(product: product, productimage: product.mainImg)
                        .frame(width: 301, height: 376)
                        .foregroundColor(.red)
                      //  .padding(.vertical, 10)
                }
            }
            
        }
    }
}

#Preview {
    NewCollectionView()
}
