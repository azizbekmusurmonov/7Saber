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
    @Published var codeLeftButton: Bool = true
    @Published var numberText: String = ""
    @Published var isCodeViewPresented = false
    @Published var numberTextFieldIsEditing: Bool = false
    @Published var codeText: String = ""
    @Published var codeTextFieldIsEditing: Bool = false
    @Published var timer: Timer?
    @Published var remainingSeconds = 120
    
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
                print("⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ send-code FAILURE", error.localizedDescription)
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
