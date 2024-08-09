//
//  UploadImage.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/06/24.
//

import UIKit
import Core

//class UploadImage {
//    
//    // Function to upload a UIImage as PNG data in a POST request with additional data
//    static func uploadImage(image: UIImage, fullName: String, gender: String, birthDate: Date, email: String, toURL url: URL) async throws {
//
//        // 1. Encode the image as PNG data
//        guard let imageData = image.resizedTo1MB else {
//            throw UploadError.encodingFailed
//        }
//
//        // 2. Create a URLRequest
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
////        request.setValue("image/png", forHTTPHeaderField: "Content-Type")
//
//        // 3. Create a boundary string for multipart/form-data
//        let boundary = UUID().uuidString
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        // 4. Build the request body
//        var body = Data()
//
//        // 4a. Image data
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.png\"\r\n".data(using: .utf8)!)
//        body.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
//        body.append(imageData)
//        print("imageData", imageData)
//        body.append("\r\n".data(using: .utf8)!)
//
//        // 4b. Full name data
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        print("boundary", boundary)
//        body.append("Content-Disposition: form-data; name=\"fullName\"\r\n\r\n".data(using: .utf8)!)
//        body.append(fullName.data(using: .utf8)!)
//        print("fullName", fullName)
//        body.append("\r\n".data(using: .utf8)!)
//
//        // 4c. Gender data
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        body.append("Content-Disposition: form-data; name=\"gender\"\r\n\r\n".data(using: .utf8)!)
//        body.append(gender.data(using: .utf8)!)
//        print("gender", gender)
//        body.append("\r\n".data(using: .utf8)!)
//
//        // 4d. Birth Date data (formatted as a string)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd" // Adjust format if needed
//        let birthDateString = dateFormatter.string(from: birthDate)
//
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        body.append("Content-Disposition: form-data; name=\"birthDate\"\r\n\r\n".data(using: .utf8)!)
//        body.append(birthDateString.data(using: .utf8)!)
//        print("birthDateString", birthDateString)
//        body.append("\r\n".data(using: .utf8)!)
//
//        // 4e. Email data
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        body.append("Content-Disposition: form-data; name=\"email\"\r\n\r\n".data(using: .utf8)!)
//        body.append(email.data(using: .utf8)!)
//        print("email", email)
//        body.append("\r\n".data(using: .utf8)!)
//
//        // 4f. End of multipart/form-data
//        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
//
//        // 5. Set the body of the request
//        request.httpBody = body
//        
////        do {
////            let a = try JSONSerialization.jsonObject(with: body)
////            print(a)
////        } catch {
////            print(error)
////        }
//        
//        print("-------------------------HEADER---------------------------------")
////        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
////        print("Content-Type", "application/json","\n")
//        request.setValue("iOS", forHTTPHeaderField: "Accept-Device")
//        if let language = DataStorage.storage.get(from: .language) as? String {
//            request.setValue(language, forHTTPHeaderField: "Accept-Language")
//            print("Accept-Language", language,"\n")
//        }
//        if let token = DataStorage.storage.get(from: .token) {
//            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//            print("Authorization", "Bearer", "TOKEN", token == nil ? "NO" : token,"\n")
//        }
//
//        // 6. Create a task with URLSession
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        // 7. Handle the response
//        guard let httpResponse = response as? HTTPURLResponse else {
//            throw UploadError.invalidResponse
//        }
//        
////        let model = try JSONDecoder().decode(ProfileModel.self, from: data)
////        
////        DataStorage.storage.update(model.token, for: .token)
//
//        // Check for successful upload
//        if (200..<300).contains(httpResponse.statusCode) {
//            print(try JSONSerialization.jsonObject(with: data))
//        } else {
//            throw UploadError.uploadFailed(statusCode: httpResponse.statusCode)
//        }
//    }
//    
//    enum UploadError: Error {
//        case encodingFailed
//        case invalidResponse
//        case uploadFailed(statusCode: Int)
//    }
//}
