//
//  RegisterMobillAppViewModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import Combine
import NetworkManager

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
                
                print("✅✅✅✅✅✅✅✅✅✅ send-code SUCCESS")
                print("SMS получен:", model.message)
            } catch {
                print("⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ send-code FAILURE", error)
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
                
                print("Пользователь существует  ✅✅✅✅✅✅✅✅✅✅ ")
                print("Имя пользователя:", model.fullName)
                print("Email пользователя:", model.email)
                
                await MainActor.run { [weak self] in
                    self?.userExists = true
                }
                
            } catch {
                self.userExists = false
                print("Ошибка при получении пользователя:  ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ ", error.localizedDescription)
            }
        }
    }
    
    func startTimer() {
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
