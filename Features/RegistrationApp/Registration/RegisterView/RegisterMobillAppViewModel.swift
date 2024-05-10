//
//  RegisterMobillAppViewModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import Combine
import NetworkManager

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
    
    @Published var message: ShowMessage? = nil
    
    public init () { }
    
    func sendCode() {
        let urlString = "https://lab.7saber.uz/api/auth/send-code"
        
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [URLQueryItem(name: "phone", value: numberText)]
        
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
    
    func getUser() {
        let url = "https://lab.7saber.uz/api/auth/get-user?email=\(numberText)"
        
        Task.detached { [weak self] in
            guard let self else { return }
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: GetUserModel.self,
                    method: .post
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
                let success = try await NetworkService.shared.request(
                    url: url,
                    decode: SendCodeModel.self,
                    method: .post,
                    parameters: ["phone": numberText, "code": codeText]
                )
                
                await MainActor.run {
                    self.message = .success(message: success.message)
                }
            } catch {
                await MainActor.run {
                    self.message = .error(message: error.localizedDescription)
                }
            }
        }
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
