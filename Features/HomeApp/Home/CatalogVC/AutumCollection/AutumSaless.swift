//
//  AutumSaless.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct AutumnSalesModel2 {
    let imageName: String = "AUTUM_Sneaker"
    let salePercentage: String = ""
    let saleTitle: String = ""
    let collectionDescription: String = "OUR AUTUMN COLLECTION IS NOW IN STOCK"
    let buttonTitle: String = "SEE ALL"
}



import SwiftUI

struct AutumnSalesView2: View {
    @StateObject var viewModel = AutumnSalesViewModel2()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if let image = UIImage(named: viewModel.model.imageName) {
                    AutumnImageView2(image: image, geometry: geometry)
                        .environmentObject(viewModel)
                    
                } else {
                    Text("Image not found")
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AutumnImageView2: View {
    var image: UIImage
    var geometry: GeometryProxy
    
    @EnvironmentObject var viewModel: AutumnSalesViewModel2
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .clipped()
            .overlay(
                VStack {
                    Spacer()
                    Text(viewModel.model.collectionDescription)
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(8)
                        .lineLimit(4)
                        .padding(.trailing, 1)
                        .padding(.leading, 60)
                        .padding(.bottom, 600)
                        .opacity(viewModel.showContent ? 1 : 0)
                        .animation(.easeInOut(duration: 1.5))
                    
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
                            .animation(.easeInOut(duration: 1.5))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, -100)
                .opacity(viewModel.showContent ? 1 : 0)
                .animation(.easeInOut(duration: 1.5)),
                alignment: .bottom
            )
            .onAppear {
                viewModel.triggerAnimation()
            }
    }
}



import SwiftUI

class AutumnSalesViewModel2: ObservableObject {
    @Published var showContent = false
    var model = AutumnSalesModel2()
    
    func triggerAnimation() {
        withAnimation {
            self.showContent = true
        }
    }
}
