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
        VStack {
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
        }.background(Color.red)
            .padding(.trailing, 0)
    }
    
    private var contentView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: -90) {  // Set spacing to 2 pixels
                switch viewModel.newCollection {
                case .some(let collection):
                    ForEach(collection.data) { product in
                        ProductItemView(product: product, productimage: product.mainImg)
                            .frame(width: 393, height: 478)
                    }
                case .none:
                    noDataView
                        .frame(width: 393, height: 478)
                }
            }
            .frame(alignment: .leading)
            
        }.background(Color.blue)
    }
    
    private var noDataView: some View {
        Text("Kutilmoqda...")
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding()
    }
}

#Preview {
    NewCollectionView()
}
