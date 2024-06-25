//
//  HomeViewContent.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import Core
import AssetKit

public struct ContentView: View {
    
    @StateObject var categoryController = CategoryController()
    @StateObject var viewModel = NewCollectionViewModel()
    @StateObject var viewModel22 = NewCollectionViewModel22()
    
    @State private var isShowingCatalogPage = false
    @State private var isShowingDetailedView = false
    
    public init() {}
    
    public var body: some View {
        
        NavigationView {
            
            VStack {
                
                BaseNavigationBar(title: "", leftImage: Asset.Image.Logo.logoBlack.image, rightImage: Asset.Image.Home.searchHome.image)
                    .frame(height: 60)
                    .padding(.top, 54)
                    .background(Blur(style: .light).opacity(0.5))
                
                ScrollView {
                    
                    VideoPlayerView(videoName: "backVideo")
                        .padding(.top, -75)
                    
                    NavigationLink(destination: CatalogPage()) {
                        CategoryView(categories: categoryController.categories)
                            .onAppear {
                                categoryController.fetchCategories()
                            }
                    }
                    
                    NewCollectionView(viewModel: viewModel)
                        .padding(.leading, 10)
                        .padding(.top, 30)
                        .onTapGesture {
                            isShowingDetailedView = true // Present DetailedView when tapped
                        }
                    
                    NewCollectionView22(viewModel22: viewModel22)
                        .padding(.leading, 10)
                        .padding(.top, 60)
                        .onTapGesture {
                            isShowingDetailedView = true // Present DetailedView when tapped
                        }
                    
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
            }
           // .customNavigation()
            .background(Color.white)
            .ignoresSafeArea(edges: .all)
        }
        .fullScreenCover(isPresented: $isShowingDetailedView) {
            DetailedView()
        }
    }
}

#Preview {
    ContentView()
}
