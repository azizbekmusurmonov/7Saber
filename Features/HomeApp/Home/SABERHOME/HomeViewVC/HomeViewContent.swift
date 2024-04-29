//
//  ContentView.swift
//  SABERHOME
//
//  Created by islombek on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var categoryController = CategoryController()
    @StateObject var viewModel = NewCollectionController()
    @StateObject var viewModel22 = NewCollectionController22()
   // @StateObject var viewModel = TrendingViewModel()
    
    @State private var isShowingCatalogPage = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                CustomNavigation()
                    .frame(height: 45)
                    .padding(.top, 15)
                
                
                
                ScrollView {
                    
                    
                    VideoPlayerView(videoName: "backVideo")
                        .padding(.top, -75)
                    
                
                    NavigationLink(destination: CatalogPage()) {
                        CategoryView(categories: categoryController.categories)
                            .onAppear {
                                categoryController.fetchCategories()
                            }
                    }
                    
                    NewCollectionView()
                        .environmentObject(viewModel)
                        
                        .padding(.leading, 10)
                    
                    NewCollectionView22()
                        .environmentObject(viewModel22)
                        
                        .padding(.leading, 10)
//
//                  //  TrendingView(viewModel: viewModel)
//                        .padding(.leading, 10)
//                        .padding(.top, 50)
                    
                    
                    SHoes()
                        .padding(.leading, 10)
                        .padding(.top, 50)
                    
                    BigText()
                        .padding(.top, 150)
                    
                    ButtonSort()
                        .padding(.top, 100)
                    
                    Family()
                    
                    VStack {
                        AutumnSalesView()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .clipped()
                        
                    }.padding(.top, -10)
                    
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
               
            }
        }
    }
}

#Preview {
    ContentView()
}


