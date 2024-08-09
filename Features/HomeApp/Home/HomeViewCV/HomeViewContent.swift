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
    @StateObject private var newCollectionViewModel = NewCollectionViewModel()
    @StateObject var trendingViewModel = TrendingViewModel()
    @StateObject var shoesViewModel = ShoesViewModel()
    
    @State private var isShowingCatalogPage = false
    @State private var isShowingDetailedView = false
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                ScrollView {
                        
//                    AVPContentView()
//                        .padding(.top)
//                    
                    NavigationLink(destination: CatalogPage()) {
                        CategoryView()
                    }
//                    
//                    NewCollectionView(viewModel: newCollectionViewModel)
//                        .padding(.top, 30)
//                        .onTapGesture {
//                            isShowingDetailedView = true // Present DetailedView when tapped
//                        }
//                    
//                    TrendingView(viewModel: trendingViewModel)
//                        .padding(.top, 30)
//                        .onTapGesture {
//                            isShowingDetailedView = true // Present DetailedView when tapped
//                        }
//                    
//                    ShoesView()
//                       
//                        .padding(.top, 30)
//                        .onTapGesture {
//                            isShowingDetailedView = true // Present DetailedView when tapped
//                        }
//                    
//                    BigText()
//                        .padding(.top, 150)
//                    
//                    ButtonSort()
//                        .padding(.top, 100)
//                    
//                 
//                    
//                    VStack {
//                        AutumnSalesView()
//                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                            .clipped()
//                        
//                    }
//                        .padding(.bottom, 80)
//                    
                }
            }
            .background(Color.white)
            .background(ignoresSafeAreaEdges: [.horizontal, .bottom])
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    BaseNavigationBar(
                        title: "",
                        leftImage: Asset.Image.Logo.logoBlack.image,
                        rightImage: Asset.Image.Home.searchHome.image
                    )
                    .frame(width: UIApplication.shared.screenFrame.width)
                    .presentationCompactAdaptation(horizontal: .fullScreenCover, vertical: .automatic)
                    .background(Blur(style: .light).opacity(0.5))
                }
            })
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .fullScreenCover(isPresented: $isShowingDetailedView) {
            DetailedView()
        }
    }
}

#Preview {
    ContentView()
}
