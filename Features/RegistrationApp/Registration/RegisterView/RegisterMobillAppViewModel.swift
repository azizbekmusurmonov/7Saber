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

enum SendCodeType: String {
    case email
    case phone
}

enum ShowMessage: Equatable {
    case success(message: String)
    case error(message: String)
}

public class RegisterMobillAppViewModel: ObservableObject {
    
    @Published var numberText: String = ""
    @Published var isCodeViewPresented = false
    @Published var codeText: String = ""
    @Published var timer: Timer?
    @Published var remainingSeconds = 60
    @Published var userExists = false
    @Published var userPassword: String = ""
    @Published var userRetryPassword: String = ""
    @Published var userFullName: String = ""
    @Published var isFullNameViewPresent: Bool = false
    @Published var isPasswordViewPresent: Bool = false
    @Published var forcelyOpenTabBar: Bool = false
    @Published var isLoading: Bool = false
    @Published var isUzbekistan: Bool = false
    @Published var userNumberExist: Bool = false
    
    @Published var message: ShowMessage? = nil
    
    public init () { }
    
    func getEmailOrNumberButtonPressed() async {
        remainingSeconds = 60
        if !numberText.isEmpty {
            if isUzbekistan {
                if numberText.contains("+998") && numberText.count == 13 {
                    await getUser(by: .phone)
                    sendCode(by: .phone)
                    
                    withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                        isCodeViewPresented = true
                    }
                } else if numberText.isNumber && numberText.count == 9 {
                    message = .error(message: "Please enter your phone number with +998")
                } else {
                    message = .error(message: "Please enter phone")
                }
            } else {
                if (numberText.contains("@gmail.com") || numberText.contains("@icloud.com")) {
                    await getUser(by: .email)
                    
                    if userExists == false {
                        sendCode(by: .email)
                    }
                    
                    withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                        isCodeViewPresented = true
                    }
                } else if numberText.contains("+"), isUzbekistan {
                    await getUser(by: .phone)
                    
                    if userExists {
                        withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                            isCodeViewPresented = true
                        }
                    }
                } else {
                    message = .error(message: "Please enter phone or mail")
                }
            }
        }
    }
    
    func sendCode(by type: SendCodeType) {
        let urlString = "https://lab.7saber.uz/api/auth/send-code"
        
        Task.detached { [weak self] in
            guard self != nil else { return }
            
            do {
                // Используем копию urlComponents
                let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: SendCodeModel.self,
                    method: .post,
                    body: [type.rawValue: self?.numberText ?? ""]
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
    
    func getUser(by type: SendCodeType) async {
        let url = "https://lab.7saber.uz/api/auth/get-user"
        
        do {
            let model = try await NetworkService.shared.request(
                url: url,
                decode: GetUserModel.self,
                method: .post,
                body:  [type.rawValue: numberText]
            )
            
            await MainActor.run {
                self.userExists = true
                self.isLoading = true
                self.userNumberExist = (model.phone != nil)
            }
        } catch {
            await MainActor.run {
                self.isLoading = true
                self.userExists = false
                self.userNumberExist = false
            }
            print("Ошибка при получении пользователя: ", error.localizedDescription)
        }
    }

    
    func checkCode() {
        let url = "https://lab.7saber.uz/api/auth/check-code-email"
        
        Task.detached { [weak self] in
            guard let self else { return }
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: SendCodeModel.self,
                    method: .post,
                    queryParameters: ["email": numberText, "code": codeText]
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: model.message)
                    if self?.userExists == true {
                        self?.forcelyOpenTabBar = true
                        
                    }
                    withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                        self?.isFullNameViewPresent.toggle()
                    }
                }
            } catch {
                
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                    
                }
            }
        }
    }
    
    func phoneRegistration() {
        let url = "https://lab.7saber.uz/api/auth/registration/phone"
        
        Task.detached { [weak self] in
            guard let self else { return }
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: RegestrationModel.self,
                    method: .post,
                    body: ["phone" : numberText, "code" : codeText] 
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "Siz muvaffaqiyatli ro'yxatdan o'tdingiz")
                    DataStorage.storage.save(model.token, for: .token)
                    DataStorage.storage.save(true, for: .isRegistrate)
                    self?.forcelyOpenTabBar = true
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                }
            }
        }
    }
    
    func emailRegistration() {
        let url = "https://lab.7saber.uz/api/auth/registration/email"
        
        Task.detached { [weak self] in
            guard let self else { return }
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: RegestrationModel.self,
                    method: .post,
                    body: ["fullName": userFullName, "email": numberText, "password": userPassword, "code": codeText]
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "Siz muvaffaqiyatli ro'yxatdan o'tdingiz")
                    DataStorage.storage.save(model.token, for: .token)
                    DataStorage.storage.save(true, for: .isRegistrate)
                    self?.forcelyOpenTabBar = true
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                }
            }
        }
    }
    
    func loginForNumber() {
        let url = "https://lab.7saber.uz/api/auth/login"
        
        Task.detached { [weak self] in
            guard let self else { return }
            
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: LoginModel.self,
                    method: .post,
                    body: ["phone" : numberText, "code" : codeText]
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "Siz muvaffaqiyatli akkauntizga kirdingiz")
                    DataStorage.storage.save(model.token, for: .token)
                    DataStorage.storage.save(true, for: .isRegistrate)
                    self?.forcelyOpenTabBar = true
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: "Kod xa'to kiritildi iltimos tekshirib boshqattan urinib ko'ring")
                    self?.isLoading = true
                }
            }
        }
    }
    
    func loginForEmail() {
        let url = "https://lab.7saber.uz/api/auth/login"
        
        Task.detached { [weak self] in
            guard let self else { return }
            
            do {
                let model = try await NetworkService.shared.request(
                    url: url,
                    decode: LoginModel.self,
                    method: .post,
                    body: ["email" : numberText, "password" : userPassword]
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "Siz muvaffaqiyatli akkauntizga kirdingiz")
                    DataStorage.storage.save(model.token, for: .token)
                    DataStorage.storage.save(true, for: .isRegistrate)
                    self?.forcelyOpenTabBar = true
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: "Parol xa'to kiritildi iltimos tekshirib boshqattan urinib ko'ring")
                    self?.isLoading = true
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
