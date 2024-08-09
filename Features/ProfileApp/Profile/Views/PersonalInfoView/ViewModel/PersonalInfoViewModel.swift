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
    @Published var birthDate: Date = Date()
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
    
//    func sendPersonalInfo() {
//        let urlString = "https://lab.7saber.uz/api/client/user/update"
//        print(profileImage?.pngData())
//        Task.detached { [weak self] in
//            guard let self, let url = URL(string: urlString), let imageData = profileImage?.pngData() else { return }
//            
//            do {
//                try await UploadImage.uploadImage(image: profileImage!, fullName: fullNam, gender: gender, birthDate: .init(), email: email, toURL: url)
//                
//                await MainActor.run { [weak self] in
//                    self?.messageShow = .succes(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli yuborildi")
//                }
//            } catch {
//                print("uplaod error ", error.localizedDescription)
//                await MainActor.run { [weak self] in
//                    self?.messageShow = .error(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli yuborilmadi")
//                }
//            }
//        }
//    }
    
    func sendPersonalInfo(fullName: String, phone: String, email: String, gender: String, avatar: UIImage) {
        let urlString = "https://lab.7saber.uz/api/client/user/update"
        
        Task.detached {
            do {
                let boundary = UUID().uuidString
                guard let url = URL(string: urlString) else {
                    print("Invalid URL")
                    return
                }
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
                
                var data = Data()
                
                func appendFormData(name: String, value: String) {
                    data.append("--\(boundary)\r\n".data(using: .utf8)!)
                    data.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n".data(using: .utf8)!)
                    data.append("\(value)\r\n".data(using: .utf8)!)
                }
                
                appendFormData(name: "fullName", value: fullName)
                print("fullName", fullName)
                appendFormData(name: "phone", value: phone)
                print("phone", phone)
                appendFormData(name: "email", value: email)
                print("email", email)
                appendFormData(name: "gender", value: gender)
                
                if let imageData = avatar.jpegData(compressionQuality: 0.7) {
                    data.append("--\(boundary)\r\n".data(using: .utf8)!)
                    data.append("Content-Disposition: form-data; name=\"avatar\"; filename=\"avatar.jpg\"\r\n".data(using: .utf8)!)
                    data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
                    data.append(imageData)
                    print("imageData", imageData)
                    data.append("\r\n".data(using: .utf8)!)
                }
                
                data.append("--\(boundary)--\r\n".data(using: .utf8)!)
                
                let (responseData, response) = try await URLSession.shared.upload(for: request, from: data)
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(PersonalInfoModel.self, from: responseData)
                    print("Update successful: \(model)")
                } else {
                    print("Failed with response: \(response)")
                }
                
                await MainActor.run { [weak self] in
                    self?.messageShow = .succes(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli yuborildi")
                }
            } catch {
                print("Error: \(error.localizedDescription)")
                await MainActor.run { [weak self] in
                    self?.messageShow = .error(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli yuborilmadi: \(error.localizedDescription)")
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
