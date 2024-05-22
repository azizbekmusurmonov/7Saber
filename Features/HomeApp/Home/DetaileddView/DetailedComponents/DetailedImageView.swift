//
//  DetailedImageView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var objectWillChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            objectWillChange.send(data)
        }
    }
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}

struct ImageSlide: View {
    @State private var currentIndex: Int = 0
    @State private var isFullScreen = false // Added state for full-screen mode
    @State private var isTransitioning = false
    
    private let clothingImageURLs = [
        "https://images.uzum.uz/cn0dk51s99ouqbft9te0/original.jpg",
        "https://images.uzum.uz/cn0dk51s99ouqbft9td0/original.jpg",
        "https://images.uzum.uz/cn0dk59s99ouqbft9teg/original.jpg",
        "https://images.uzum.uz/cn0dk5125kub33f2g880/original.jpg",
        "https://images.uzum.uz/cn0dk51s99ouqbft9tdg/original.jpg"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 0) {
                ForEach(0..<clothingImageURLs.count, id: \.self) { index in
                    RemoteImage(urlString: self.clothingImageURLs[index])
                        .frame(width: 393, height: 511)
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
        .fullScreenCover(isPresented: $isFullScreen, onDismiss: {
            withAnimation {
                self.isTransitioning = false
            }
        }, content: {
            ImageSlide2()
        })
    }
    
    // Toggle full-screen mode
    private func toggleFullScreen() {
        self.isTransitioning = true
        self.isFullScreen = true
    }
}

struct ImageSlide_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlide()
    }
}

struct RemoteImage: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(urlString: String) {
        imageLoader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        if let image = UIImage(data: imageLoader.data) {
            return Image(uiImage: image)
                .resizable()
        } else {
            return Image(systemName: "")
                
        }
    }
}
