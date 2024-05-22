//
//  RegisterMobillAppViewModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import Combine
import NetworkManager
import Core

enum ShowMessage: Equatable {
    case success(message: String)
    case error(message: String)
}

public class RegisterMobillAppViewModel: ObservableObject {
    
    @Published var registerLeftButton: Bool = false
    @Published var numberText: String = ""
    @Published var isCodeViewPresented = false
    @Published var numberTextFieldIsEditing: Bool = false
    @Published var codeText: String = ""
    @Published var codeTextFieldIsEditing: Bool = false
    @Published var timer: Timer?
    @Published var remainingSeconds = 120
    @Published var userExists = false
    @Published var userPassword: String = ""
    @Published var userRetryPassword: String = ""
    @Published var passwordImageEye: Bool = true
    @Published var userFullName: String = ""
    @Published var isFullNameViewPresent: Bool = false
    @Published var isPasswordViewPresent: Bool = false
    @Published var forcelyOpenTabBar: Bool = false
    
    @Published var message: ShowMessage? = nil
    
    public init () { }
    
    func sendCode() {
        let urlString = "https://lab.7saber.uz/api/auth/send-code"
        
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [URLQueryItem(name: "phone", value: numberText)]
        
        print("numberText", numberText)
        // Создаем копию urlComponents
        let copiedURLComponents = urlComponents
        
        Task.detached { [weak self] in
            guard self != nil else { return }
            
            do {
                // Используем копию urlComponents
                let model = try await NetworkService.shared.request(
                    url: copiedURLComponents.url!.absoluteString,
                    decode: SendCodeModel.self,
                    method: .post
                )
                await MainActor.run { [weak self] in
                    self?.startTimer()
                    self?.message = .success(message: model.message)
                    
                }
                
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .success(message: error.localizedDescription)
                }
            }
        }
    }
    
    struct UserEntity: Codable {
        let user: UserModel
        
        init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<RegisterMobillAppViewModel.UserEntity.CodingKeys> = try decoder.container(keyedBy: RegisterMobillAppViewModel.UserEntity.CodingKeys.self)
            self.user = try container.decode(UserModel.self, forKey: RegisterMobillAppViewModel.UserEntity.CodingKeys.user)
        }
    }
    
    func getUser() {
        let url = "https://lab.7saber.uz/api/auth/get-user"
        
        Task.detached { [weak self] in
            guard let self else { return }
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: UserModel.self,
                    method: .post,
                    queryParameters: ["phone": numberText]
                )
            
                await MainActor.run { [weak self] in
                    self?.userExists = true
                }
                
            } catch {
                await MainActor.run {
                    self.userExists = false
                }
                print("Ошибка при получении пользователя:  ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ ", error.localizedDescription)
            }
        }
    }
    
    func checkCode() {
        let url = "https://lab.7saber.uz/api/auth/check-code"
        
        Task.detached { [weak self] in
            guard let self else { return }
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: SendCodeModel.self,
                    method: .post,
                    queryParameters: ["phone": "+998900031433", "code": codeText]
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: model.message)
                    if self?.userExists == true {
                        self?.forcelyOpenTabBar = true
                    }
                }
            } catch {
                
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                }
            }
        }
    }
    
    func registr() {
        let urlString = "https://lab.7saber.uz/api/auth/registration"
        var request = URLRequest(url: URL(string: urlString)!)
        
        // set header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        // set HTTP Method
        request.httpMethod = "POST"
        
        // set body parameters
        let parameters: [String: Any] = [
            "fullName": userFullName,
            "phone": numberText,
            "code": codeText
        ]
        request.httpBody = parameters.percentEncoded()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { // Check if there's an error first
                print("⛔️⛔️⛔️⛔️⛔️⛔️⛔️error", error)
                // Handle the error appropriately, maybe even return from the closure
                return
            }

            guard
                let data = data,
                let response = response as? HTTPURLResponse
            else {
                print("⛔️⛔️⛔️⛔️⛔️⛔️⛔️error: invalid data or response")
                // Handle the case where data or response is nil
                return
            }

            guard (200 ... 299) ~= response.statusCode else {
                print("statusCode should be 2xx, but is \(response.statusCode)")
                // Handle non-2xx status codes
                return
            }

            do {
                let model = try JSONDecoder().decode(SuccessRegistratedModel.self, from: data)
                
                DataStorage.storage.save(model.token, for: .token)
                DataStorage.storage.save(true, for: .isRegistrate)
                self.forcelyOpenTabBar = true
            } catch {
                print("Error deserializing JSON: \(error)")
                
            }
        }

        task.resume()

    }
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                self.stopTimer()
            }
        }
    }
        
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

extension Dictionary {
    public func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}





