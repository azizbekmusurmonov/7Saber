//
//  AutumSales.swift
//  SABERHOME
//
//  Created by islombek on 31/03/24.
//

//
//import SwiftUI
//
//struct AutumSales: View {
//    @State private var showContent = false // State variable to control the animation
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView {
//                if let image = UIImage(named: "AUTUM_SALES") {
//                    Image(uiImage: image)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .clipped()
//                        .overlay(
//                            VStack(alignment: .leading) {
//                                Text("30%")
//                                    .font(.system(size: 70))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                    .padding(8)
//                                    .cornerRadius(5)
//                                    .padding(.top, 16)
//                                    .padding(.leading, 16)
//                                Text("AUTUMN SALES")
//                                    .font(.title)
//                                    .foregroundColor(.white)
//                                    .padding(8)
//                                    .cornerRadius(5)
//                                    .padding(.top, -20)
//                                    .padding(.leading, 16)
//                                    .padding(.trailing, 16)
//                            }
//                            .frame(maxWidth: 200, alignment: .leading)
//                            .padding(.bottom, 16)
//                            .padding(.top, 16)
//                            .opacity(showContent ? 1 : 0) // Apply opacity based on state
//                                .animation(.easeInOut(duration: 1.0)) // Animation for the opacity change
//                            ,
//                            alignment: .topLeading
//                        )
//                        .overlay(
//                            VStack(alignment: .trailing) {
//                                Text("OUR AUTUMN COLLECTION IS NOW IN STOCK")
//                                    .font(.system(size: 25))
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.white)
//                                    .padding(8)
//                                    .lineLimit(4)
//                                    .padding(.trailing, 1)
//                                    .padding(.top,640)
//                                    .opacity(showContent ? 1 : 0) // Apply opacity based on state
//                                    .animation(.easeInOut(duration: 1.5)) // Animation for the opacity change
//                                Spacer()
//                                Button(action: {
//                                    // Button action here
//                                }) {
//                                    Text("SEE ALL")
//                                        .font(.title3)
//                                        .foregroundColor(.black)
//                                        .padding(8)
//                                        .frame(maxWidth: .infinity)
//                                        .background(
//                                            LinearGradient(
//                                                gradient: Gradient(colors: [Color.white, Color.gray]),
//                                                startPoint: .topLeading,
//                                                endPoint: .bottomTrailing)
//                                        )
//                                        .cornerRadius(20)
//                                        .padding(.horizontal, 40)
//                                        .padding(.bottom, 40)
//                                        .opacity(showContent ? 1 : 0) // Apply opacity based on state
//                                        .animation(.easeInOut(duration: 1.5)) // Animation for the opacity change
//                                }
//                            }
//                            .frame(maxWidth: 220, alignment: .trailing)
//                            .padding(.bottom, 1)
//                            .padding(.top, 16)
//                            .opacity(showContent ? 1 : 0) // Apply opacity based on state
//                            .animation(.easeInOut(duration: 1.5)) // Animation for the opacity change
//                            ,
//                            alignment: .bottomTrailing
//                        )
//                        .onAppear {
//                            // Trigger the animation when the view appears
//                            withAnimation {
//                                self.showContent = true
//                            }
//                        }
//                } else {
//                    Text("Image not found")
//                }
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ContentView_Previews2: PreviewProvider {
//    static var previews: some View {
//        AutumSales()
//    }
//}







//import SwiftUI
//
//struct AutumSales: View {
//    @State private var image: UIImage? = nil
//    
//    var body: some View {
//        ScrollView {
//            if let image = image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .padding(.all, 0)
//                    .frame(width: 393, height: 1040)
//            } else {
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle())
//                    .onAppear(perform: loadImage)
//            }
//        }
//    }
//    
//    func loadImage() {
//        guard let url = URL(string: "https://i.pinimg.com/564x/ca/16/e4/ca16e446c4d009b120eb94397eff787e.jpg") else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            
//            DispatchQueue.main.async {
//                self.image = UIImage(data: data)
//            }
//        }.resume()
//    }
//}
//
//struct ContentView_Previews2: PreviewProvider {
//    static var previews: some View {
//        AutumSales()
//    }
//}




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
                .opacity(viewModel.showContent ? 1 : 0)
                .animation(.easeInOut(duration: 1.0)),
                alignment: .topLeading
            )
            .overlay(
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
                        .animation(.easeInOut(duration: 1.5))
                    Spacer()
                    Button(action: {
                        // Button action here
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
                .frame(maxWidth: 220, alignment: .trailing)
                .padding(.bottom, 1)
                .padding(.top, 16)
                .opacity(viewModel.showContent ? 1 : 0)
                .animation(.easeInOut(duration: 1.5)),
                alignment: .bottomTrailing
            )
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
