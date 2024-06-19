//
//  Imagepicker.swift
//  Core
//
//  Created by admin on 5/9/24.
//

import Foundation
import SwiftUI
import UIKit

public struct ImagePicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode)
    private var presentationMode

    public let sourceType: UIImagePickerController.SourceType
    public let onImagePicked: (UIImage) -> Void
    public let maxFileSize: Int // Maximum file size in bytes (1 MB = 1 * 1024 * 1024)

    public init(sourceType: UIImagePickerController.SourceType, maxFileSize: Int = 1 * 1024 * 1024, onImagePicked: @escaping (UIImage) -> Void) {
        self.sourceType = sourceType
        self.onImagePicked = onImagePicked
        self.maxFileSize = maxFileSize
    }

    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding
        public var presentationMode: PresentationMode
        public let sourceType: UIImagePickerController.SourceType
        public let onImagePicked: (UIImage) -> Void
        public let maxFileSize: Int

        public init(presentationMode: Binding<PresentationMode>, sourceType: UIImagePickerController.SourceType, maxFileSize: Int, onImagePicked: @escaping (UIImage) -> Void) {
            _presentationMode = presentationMode
            self.sourceType = sourceType
            self.onImagePicked = onImagePicked
            self.maxFileSize = maxFileSize
        }

        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                // Compress the image to the desired file size
                let compressedImage = compressImage(uiImage, to: maxFileSize)
                onImagePicked(compressedImage)
            }
            presentationMode.dismiss()
        }

        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }

        private func compressImage(_ image: UIImage, to maxFileSize: Int) -> UIImage {
            var compression: CGFloat = 1.0
            var imageData = image.jpegData(compressionQuality: compression)
            
            while let data = imageData, data.count > maxFileSize, compression > 0 {
                compression -= 0.1
                imageData = image.jpegData(compressionQuality: compression)
            }
            
            guard let compressedData = imageData, let compressedImage = UIImage(data: compressedData) else {
                return image // Return original image if compression fails
            }
            return compressedImage
        }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, sourceType: sourceType, maxFileSize: maxFileSize, onImagePicked: onImagePicked)
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
