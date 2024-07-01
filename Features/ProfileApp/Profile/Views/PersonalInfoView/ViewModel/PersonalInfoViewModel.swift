//
//  PersonalInfoViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 24/04/24.
//

import SwiftUI
import Combine
import NetworkManager
import Core

public enum MessageShow: Equatable {
    case succes(message: String)
    case error(message: String)
}

public class PersonalInfoViewModel: ObservableObject {
    @Published var fullNam: String = "" {
        didSet {
            checkToValid()
        }
    }
    @Published var phoneNamber: String = "" {
        didSet {
            checkToValid()
        }
    }
    @Published var email: String = "" {
        didSet {
            checkToValid()
        }
    }
    @Published var gender: String = "" {
        didSet {
            checkToValid()
        }
    }
    @Published var birthDate: String = "" 
    @Published var profileImage: UIImage? = nil {
        didSet {
            checkToValid()
        }
    }
    
    @Published public var isFormValid: Bool = false
    
    public func checkToValid() {
        isFormValid = !fullNam.isEmpty && !phoneNamber.isEmpty && !email.isEmpty
    }
    
    @Published var messageShow: MessageShow? = nil
    @Published var selectGender: SelectGender? = nil
    
    public init() { }
    
    func sendPersonalInfo() {
        let urlString = "https://lab.7saber.uz/api/client/user/update"
        print(profileImage?.pngData())
        Task.detached { [weak self] in
            guard let self, let url = URL(string: urlString), let imageData = profileImage?.pngData() else { return }
            
            do {
                try await UploadImage.uploadImage(image: profileImage!, fullName: fullNam, gender: gender, birthDate: .init(), email: email, toURL: url)
                
                await MainActor.run { [weak self] in
                    self?.messageShow = .succes(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli yuborildi")
                }
            } catch {
                print("uplaod error ", error.localizedDescription)
                await MainActor.run { [weak self] in
                    self?.messageShow = .error(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli yuborilmadi")
                }
            }
        }
    }
}


extension UIImage {
    func resized(to mb: Int) -> Data? {
        let limitedImage = limited(by: CGSize(width: 1000, height: 1000))
        let singleMB: Double = 1 * 1024 * 1024 // 1Mb / 1024 Kb / 1024 * 1024 B
        let maxImageSizeMB = Double(mb)

        var compressionQuality: CGFloat = 0.5
        var data = limitedImage?.jpegData(compressionQuality: compressionQuality)
        repeat {
            compressionQuality -= 0.04
            data = limitedImage?.jpegData(compressionQuality: compressionQuality)
        } while (Double(data?.count ?? 0) / singleMB) > maxImageSizeMB && compressionQuality > 0

        return data
    }

    func limited(by maxSize: CGSize) -> UIImage? {
        if size.width <= maxSize.width && size.height <= maxSize.height {
            return self
        }

        let widthRatio = maxSize.width / size.width
        let heightRatio = maxSize.height / size.height

        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: maxSize.height)
        } else {
            newSize = CGSize(width: maxSize.width, height: size.height * widthRatio)
        }

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1)
        draw(in: CGRect(origin: .zero, size: newSize))
        defer { UIGraphicsEndImageContext() }
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    var resizedTo1MB: Data? {
        resized(to: 1)
    }

    var resizedTo3MB: Data? {
        resized(to: 3)
    }
}
