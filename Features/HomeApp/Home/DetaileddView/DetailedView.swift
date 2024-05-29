//
//  DetailedView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct DetailedView: View {
    
    @StateObject var categoryController = CategoryController()
    @StateObject var viewModel = NewCollectionViewModel()
    @StateObject var viewModel22 = NewCollectionViewModel22()
    @State private var selectedColor: Color?

   // @StateObject var viewModel = TrendingViewModel()
    
    @State private var isShowingCatalogPage = false
    
    var body: some View {
        
        NavigationView {
            
       
            VStack {
                Detailednavigation()
                    //.frame(height: 45)
                    .padding(.top, 15)
                
                ScrollView {
                    
                    ImageSlide()
                        .padding(.top, 0)
                    
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("PRO'22")
                            .fontWeight(.medium)
                            .font(.system(size: 40))
                            .padding(.leading, 0)
                        
                        Text("7BIG T-SHIRT")
                            .fontWeight(.medium)
                            .font(.system(size: 40))
                            .padding(.leading, 0)
                    }
                    .padding(.leading, -110)
                    
                    
                    
                    
                    
                    VStack {
                        Text("Size")
                            .font(.system(size: 15))
                            .padding(.leading, -175)
                        
                        SizePickerView()
                            .padding(.leading, -50)
                            .padding(.top, -21)
                    }.padding(.top)
                    
                    
                    
                    Divider()
                    
                    
                    
                    VStack {
                        Text("Color")
                            .font(.system(size: 15))
                            .padding(.leading, -175)
                            .padding(.top, 10)
                        
                        ColorPickView(selectedColor: $selectedColor)
                            .padding(.top, -10)
                        
                    }
                    
                    
                    
                    Divider()
                    Spacer()
                    
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image("humangray")
                            Text("Free standard shipping for 7SaberClub members")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                        HStack {
                            Image("repeat")
                            Text("60-day Free returns and exchanges")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                        HStack {
                            Image("fastshop")
                            Text("Express Shipping service is available")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                    }.padding(.top, 90)
                        .padding(.leading, -40)
                    

                    Spacer()
                    
                    DetaileRow()
                        .padding(.top, 40)
                    
                    ImageUploadView()
                        .padding(.top, 30)
                    
                    NewCollectionView22(viewModel22: viewModel22)
                        .padding(.leading, 10)
                        .padding(.top, 60)
                    
                    VStack {
                        
                        Text("COMPLATE THE LOOK")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .padding(.leading, -150)
                        
                        
                        
                        
                        ImageCostView(imageUrl: "https://i.pinimg.com/564x/1f/c7/28/1fc728363fb792fa8e83420feba66912.jpg")
                        
                    
                        
                    }.padding(.top, 30)
                    
                    VStack{
                        
                    }.frame(height: 100)
                   
                    
                }.padding(.top, -5)
                //.scrollIndicators(.hidden)
               // .ignoresSafeArea()
               
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    DetailedView()
}



