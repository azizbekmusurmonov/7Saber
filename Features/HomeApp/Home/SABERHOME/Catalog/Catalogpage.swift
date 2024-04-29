//
//  Ca.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//


import SwiftUI

struct CatalogPage: View {
   
    @StateObject var categoryController = CategoryController()
    @StateObject var controller2 = NewCollectionController()
    
    var body: some View {
        
        
        
        ScrollView {
            
            CategoryView(categories: categoryController.categories)
                        .onAppear {
                            categoryController.fetchCategories()
                        }
            
SegmentedController()
            
            ThreeItemView()
            
//            NewCollectionView2(products: controller2.products)
//                .onAppear {
//                    controller2.fetchProducts()
//                }
//                .padding(.leading, 10)
//            
               
            VStack {
                AutumnSalesView2()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .clipped()
                    
            }.padding(.top, 50)
             
        }
        .scrollIndicators(.hidden)
        .navigationBarTitle("Catalog")
 
    }

}

#Preview {
    CatalogPage()
}


