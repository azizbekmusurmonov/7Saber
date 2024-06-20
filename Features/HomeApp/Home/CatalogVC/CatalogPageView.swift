//
//  CatalogPageView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct CatalogPage: View {
   
  //  @StateObject var categoryController = CategoryController()
    @StateObject var viewModel = NewCollectionViewModel()
    @StateObject var viewModel22 = NewCollectionViewModel22()
    
    var body: some View {
        
        
        
        ScrollView {
            NavigationLink(destination: CatalogPage()) {
                CategoryView(viewModel: CategoryViewModel())                        }
            
            SegmentedController()
                        .padding(.top, -60)
            
            ThreeItemView()
            
            NewCollectionView(viewModel: viewModel)
                .padding(.top, 30)
                .padding(.leading, 10)
            
            NewCollectionView22(viewModel22: viewModel22)
                .padding(.top, 30)
                .padding(.leading, 10)
            
               
            VStack {
                AutumnSalesView2()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .clipped()
                    
            }.padding(.top, 50)
            
           
             
        }
       
        
 
    }

}

#Preview {
    CatalogPage()
}


