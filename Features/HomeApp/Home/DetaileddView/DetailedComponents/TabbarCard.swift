//
//  TabbarCard.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct ContentViewq: View {
    @State private var selectedColor: Color?

    var body: some View {
        TabView {
            PriceView(selectedColor: selectedColor)
        }
    }
}


struct PriceView: View {
    var selectedColor: Color?

    var body: some View {
        VStack {
            Text("Price")
                .font(.title)
                .padding()
            Spacer()
            HStack {
                Text("430 000 UZS")
                    .padding(.leading)
                Spacer()
                AddToCartButton()
                    .foregroundColor(selectedColor)
            }
            .padding()
        }
    }
}

struct AddToCartButton: View {
    var body: some View {
        Button(action: {
            // Add to cart action
        }) {
            HStack {
                Text("Add to Cart")
                Image("ColorCheck")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(25)
        }
    }
}

struct ContentView_Previewsq: PreviewProvider {
    static var previews: some View {
        ContentViewq()
    }
}















import SwiftUI

struct ImageCostView: View {
    let imageUrl: String
    
    var body: some View {
        VStack {
            
            ZStack {
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:400, height: 600)
                            .cornerRadius(10)
                    default:
                        ProgressView()
                    }
                }
                
                HStack {
                    CircleBlurButton()
                        .position(x: UIScreen.main.bounds.width * 0.3, y: 0)
                    
                    CircleBlurButton()
                        .position(x: -30, y: 400)
                    
                    CircleBlurButton()
                        .position(x: UIScreen.main.bounds.width * 0.04, y: 250)
                }
                .frame(height: 300)
                .padding()
            }
        }
    }
}

struct CircleBlurButton: View {
    @State private var isTapped: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white.opacity(0.8))
                .frame(width: 50, height: 50)
                .blur(radius: isTapped ? 10 : 0)
            
            Circle()
                .foregroundColor(isTapped ? Color.white : Color.white.opacity(0.2))
                .frame(width: 50, height: 50)
                .onTapGesture {
                    withAnimation {
                        isTapped.toggle()
                    }
                }
            
            if isTapped {
                BlurView(text: "420 000 UZS")
                    .frame(width: 225, height: 116)
                    .cornerRadius(10)
                    .offset(y: -100)
            }
        }
    }
}

struct BlurView: View {
    let text: String
    
    var body: some View {
        ZStack {
            Color.white
                .opacity(0.9)
                .blur(radius: 10)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.5), lineWidth: 1)
                )
            Text("7LINE LEGGINGS")
                .foregroundColor(.black)
                .padding(.top, -40)
                .padding(.leading, -80)
                .font(.system(size: 15))
            
            Text("Woman’s | Tresses and Shorts")
                .foregroundColor(.gray)
                .padding(.top, -15)
                .padding(.leading, -40)
                .font(.system(size: 11))
            
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 25))
                .fontWeight(.medium)
                .padding(.top, 50)
                .padding(.leading, -40)
        }
        
        VStack {
            Image(systemName: "chevron.right")
                .frame(width: 20, height: 20)
        }.padding(.leading, 180)
    }
}

struct ImageCostView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCostView(imageUrl: "https://i.pinimg.com/564x/1f/c7/28/1fc728363fb792fa8e83420feba66912.jpg")
    }
}



















import SwiftUI

struct ImageCostView22: View {
    let imageUrl: String
    
    var body: some View {
        VStack {
            
            ZStack {
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 600)
                            .cornerRadius(10)
                            
                    default:
                        ProgressView()
                    }
                }
                
                HStack {
                    CircleBlurButton()
                        .position(x: UIScreen.main.bounds.width * 0.3, y: 0)
                    
                    CircleBlurButton()
                        .position(x: -30, y: 400)
                    
                    CircleBlurButton()
                        .position(x: UIScreen.main.bounds.width * 0.04, y: 250)
                }
                .frame(height: 300)
                .padding()
            }
        }
    }
}


struct BlurView22: View {
    let text: String
    
    var body: some View {
        ZStack {
            Color.white
                .opacity(0.9)
                .blur(radius: 10)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.5), lineWidth: 1)
                )
            Text("7LINE LEGGINGS")
                .foregroundColor(.black)
                .padding(.top, -40)
                .padding(.leading, -80)
                .font(.system(size: 15))
            
            Text("Woman’s | Tresses and Shorts")
                .foregroundColor(.gray)
                .padding(.top, -15)
                .padding(.leading, -40)
                .font(.system(size: 11))
            
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 25))
                .fontWeight(.medium)
                .padding(.top, 50)
                .padding(.leading, -40)
        }
        
        VStack {
            Image(systemName: "chevron.right")
                .frame(width: 20, height: 20)
        }.padding(.leading, 180)
    }
}


