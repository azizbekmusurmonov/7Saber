//
//  ImageUpload.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import UIKit

struct ImageUploadView: View {
    let imageUrls = [
        "https://images.uzum.uz/cns1rudod9o9u8o1ngfg/original.jpg",
        "https://images.uzum.uz/cod4doi1om4pepdvolog/original.jpg",
        "https://images.uzum.uz/clg7j65ennt1kt4dihjg/original.jpg",
        "https://images.uzum.uz/clga5k7n7c6qm23k8log/original.jpg"
    ]
    
    @State private var uploadedImage: UIImage?
    @State private var showImagePicker = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("HOW OTHERS WEARING 7SABER")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding()
                .padding(.leading)
            
            Text("Upload your photo or mention @7Saber on Instagram for a chance to be introduced")
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.top, -6)
                .padding(.leading)
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        // Image Uploader
                        ZStack {
                            if let uploadedImage = uploadedImage {
                                Image(uiImage: uploadedImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 314, height: 314)
                                    .background(Color.gray) // Set background color here
                                    .cornerRadius(10)
                            } else {
                                Circle()
                                    .stroke(Color.black, lineWidth: 2)
                                    .frame(width: 72, height: 72)
                                    .onTapGesture {
                                        self.showImagePicker.toggle()
                                    }
                                   
                                    .overlay(
                                        Image(systemName: "plus")
                                            .foregroundColor(.black)
                                            .font(.title),
                                        alignment: .center
                                    )
                                
                            }
                            if uploadedImage == nil {
                                Text("Add your photo, be one of us")
                                    .foregroundColor(.black)
                                    .padding(.top, 120)
                            }
                        }
                        .frame(width: 314, height: 314)
                        .padding()
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(image: $uploadedImage)
                        }
                        
                        // Other Images
                        ForEach(imageUrls.indices.dropFirst(), id: \.self) { index in
                            RemoteImage222(url: imageUrls[index])
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 314, height: 314)
                        }
                    }.background(Color.white)
                }.frame(width: UIScreen.main.bounds.width, height: 314)
                .padding(.top)
            }
        }
    }
}

struct RemoteImage222: View {
    let url: String
    @State private var image: UIImage?
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
                .onAppear(perform: loadImage)
        }
    }
    
    private func loadImage() {
        guard let imageUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
}

