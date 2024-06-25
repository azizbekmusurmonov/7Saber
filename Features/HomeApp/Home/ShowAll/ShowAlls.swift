//
//  ShowAlls.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct ShowAll: View {
    
    //@StateObject var categoryController = CategoryController()
    @StateObject var viewModel = NewCollectionViewModel()
    @StateObject var viewModel22 = NewCollectionViewModel22()
    @State private var isShowingCatalogPage = false

    var body: some View {
        NavigationView {
            VStack {
//                CustomNavigation()
//                    .frame(height: 45)
//                    .padding(.top, 15)
                
                ScrollView {
                    Divider()
                    SegmentedController2()
                        .padding()
                    Divider()
                    
                    NavigationLink(destination: DetailedView()) {
                        NewCollectionView22(viewModel22: viewModel22)
                            .padding(.leading, 10)
                            .padding(.top, 60)
                    }
                    
                    NavigationLink(destination: DetailedView()) {
                        NewCollectionView22(viewModel22: viewModel22)
                            .padding(.leading, 10)
                            .padding(.top, 60)
                    }
                    
//                    NavigationLink(destination: DetailedView()) {
//                        SHoes()
//                            .padding(.leading, 10)
//                            .padding(.top, 50)
//                    }
                }
             
            }.customNavigation()
        }
    }
}

