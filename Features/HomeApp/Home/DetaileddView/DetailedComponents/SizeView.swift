//
//  SizeView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct ImageSlide2: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex: Int = 0
    @State private var isFullScreen = false // Added state for full-screen mode
    private let clothingImageURLs = [
        "https://images.uzum.uz/cn0dk51s99ouqbft9te0/original.jpg",
        "https://images.uzum.uz/cn0dk51s99ouqbft9td0/original.jpg",
        "https://images.uzum.uz/cn0dk59s99ouqbft9teg/original.jpg",
        "https://images.uzum.uz/cn0dk5125kub33f2g880/original.jpg",
        "https://images.uzum.uz/cn0dk51s99ouqbft9tdg/original.jpg"
    ]
    
    var body: some View {
        ZStack(alignment: .topTrailing) { // Adjust alignment for top-right corner
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<clothingImageURLs.count, id: \.self) { index in
                            RemoteImage2(url: URL(string: self.clothingImageURLs[index]))
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                .clipped()
                                .scaleEffect(index == currentIndex ? 1 : 1) // Scale the current image to 100%, others to 80%
                                .animation(.default, value: currentIndex)
                                .onTapGesture {
                                    withAnimation {
                                        self.currentIndex = index
                                        self.toggleFullScreen()
                                    }
                                }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .offset(x: -CGFloat(currentIndex) * UIScreen.main.bounds.width)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .animation(.default, value: currentIndex)
                
                HStack {
                    Spacer()
                    Button(action: {
                        if currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(.leading, 30)
                    
                    Button(action: {
                        if currentIndex < clothingImageURLs.count - 1 {
                            currentIndex += 1
                        }
                    }) {
                        Image(systemName: "chevron.right.circle.fill")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding()
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.top, 400)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // Toggle full-screen mode
    private func toggleFullScreen() {
        withAnimation {
            self.isFullScreen.toggle()
        }
    }
}

struct RemoteImage2: View {
    private let url: URL?
    @State private var image: UIImage? = nil
    
    init(url: URL?) {
        self.url = url
    }
    
    var body: some View {
        if let image = self.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .clipped()
                .onAppear {
                    loadImage()
                }
        } else {
            ProgressView()
                .onAppear {
                    loadImage()
                }
        }
    }
    
    private func loadImage() {
        guard let url = self.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

struct ImageSlide2_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlide2()
    }
}










import SwiftUI

struct SizePickerView: View {
    let sizes = ["2XS", "XS", "S", "M", "L", "XL", "2XL", "3XL"]
    @State private var selectedSize: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 5) {
                ForEach(sizes.prefix(5), id: \.self) { size in
                    SizeButton(size: size, isSelected: size == selectedSize) {
                        selectedSize = size
                    }
                }
            }
            .padding(.leading)
            
            HStack(spacing: 5) {
                ForEach(sizes.suffix(3), id: \.self) { size in
                    SizeButton(size: size, isSelected: size == selectedSize) {
                        selectedSize = size
                    }
                }
            }
            .padding(.leading)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(40)
        .padding()
    }
}

struct SizeButton: View {
    let size: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(size)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .white : .gray) // Set text color to gray
                .frame(width: 60, height: 48)
                .background(isSelected ? Color.gray : Color.white)
               
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.gray, lineWidth: 1)
                )
                .scaleEffect(isSelected ? 1.1 : 1.0)
        }
    }
}


#Preview {
        SizePickerView()
}

