//
//  AutumSales.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import SwiftUI

struct AutumnSalesModel {
    let imageName: String = "AUTUM_SALES"
    let salePercentage: String = "30%"
    let saleTitle: String = "AUTUMN SALES"
    let collectionDescription: String = "OUR AUTUMN COLLECTION IS NOW IN STOCK"
    let buttonTitle: String = "SEE ALL"
}



import SwiftUI

struct AutumnSalesView: View {
    @StateObject var viewModel = AutumnSalesViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if let image = UIImage(named: viewModel.model.imageName) {
                    AutumnImageView(image: image, geometry: geometry)
                        .environmentObject(viewModel)
                    
                } else {
                    Text("Image not found")
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AutumnImageView: View {
    var image: UIImage
    var geometry: GeometryProxy
    
    @EnvironmentObject var viewModel: AutumnSalesViewModel
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .clipped()
            .overlay(
                VStack(alignment: .leading) {
                    Text(viewModel.model.salePercentage)
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(8)
                        .cornerRadius(5)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    Text(viewModel.model.saleTitle)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(8)
                        .cornerRadius(5)
                        .padding(.top, -20)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                }
                .frame(maxWidth: 200, alignment: .leading)
                .padding(.bottom, 16)
                .padding(.top, 16)
                .opacity(viewModel.showContent ? 1 : 0),
               
                alignment: .topLeading
            )
            .overlay(alignment: .topLeading) {
                VStack(alignment: .trailing) {
                    Text(viewModel.model.collectionDescription)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(8)
                        .lineLimit(4)
                        .padding(.trailing, 1)
                        .padding(.top, 640)
                        .opacity(viewModel.showContent ? 1 : 0)
                      
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text(viewModel.model.buttonTitle)
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
                            .opacity(viewModel.showContent ? 1 : 0)
                           
                    }
                }
                .frame(maxWidth: 220, alignment: .trailing)
                .padding(.bottom, 1)
                .padding(.top, 16)
                .opacity(viewModel.showContent ? 1 : 0)
            }
                
            
            .onAppear {
                viewModel.triggerAnimation()
            }
    }
}



import SwiftUI

class AutumnSalesViewModel: ObservableObject {
    @Published var showContent = false
    var model = AutumnSalesModel()
    
    func triggerAnimation() {
        withAnimation {
            self.showContent = true
        }
    }
}
