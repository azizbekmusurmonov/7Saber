//
//  AutumSales.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import SwiftUI

struct AutumnSalesView: View {
    @StateObject var viewModel = AutumnSalesViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let model = viewModel.model, let imageUrl = URL(string: model.webMedia.src) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                            .overlay(
                                AutumnImageView(image: image, geometry: geometry)
                                    .environmentObject(viewModel)
                            )
                    } placeholder: {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                } else {
                    Text("Failed to load data")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}








import SwiftUI

struct AutumnImageView: View {
    var image: Image
    var geometry: GeometryProxy
    
    @EnvironmentObject var viewModel: AutumnSalesViewModel
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .clipped()
            .overlay(
                VStack(alignment: .leading) {
                    Text(viewModel.salePercentage)
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(8)
                        .cornerRadius(5)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    Text(viewModel.saleTitle)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(8)
                        .cornerRadius(5)
                        .padding(.top, -20)
                        .padding(.leading, 40)
                        .padding(.trailing)
                }
                .frame(maxWidth: 200, alignment: .leading)
                .padding(.bottom, 16)
                .padding(.top, 16),
                alignment: .topLeading
            )
            .overlay(
                VStack(alignment: .trailing) {
                    Text(viewModel.collectionDescription)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(8)
                        .cornerRadius(5)
                        .lineLimit(4)
                        .padding(.trailing, 1)
                        .padding(.top, geometry.size.height * 0.5)
                      
                    Spacer()
                    Button(action: {
                     
                    }) {
                        Text(viewModel.buttonTitle)
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.gray]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 40)
                    }
                }
                .frame(maxWidth: 220, alignment: .trailing)
                .padding(.bottom, 1)
                .padding(.top, 16),
                alignment: .bottom
            )
    }
}
