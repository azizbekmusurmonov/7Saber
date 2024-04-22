//
//  RegisterMobillAppViewModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import Combine

public class RegisterMobillAppViewModel: ObservableObject {
    
    @Published var registerLeftButton: Bool = false
    @Published var codeLeftButton: Bool = true
    @Published var numberText: String = ""
    @Published var isCodeViewPresented = false
    @Published var numberTextFieldIsEditing: Bool = false
    @Published var codeText: String = ""
    @Published var codeTextFieldIsEditing: Bool = false
    @Published var timer: Timer?
    @Published var remainingSeconds = 3
    
    var cancelable = Set<AnyCancellable>()
    
    public init () { }
    
    func nextButtonTapped() {
        let urlString = "https://lab.7saber.uz/api/auth/send-code"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPURLRequestMethod.post.rawValue
        
        let param: [String: Any] = ["phone": numberText]
        
        request.httpBody = param.percentEncoded()
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200, response.statusCode <= 300 else { return data }
                
                return data
            }
            .decode(type: SendCodeModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    print("✅✅✅✅✅✅✅✅✅✅ send-code SUCCES")
                    break
                case .failure(let error):
                    print("⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ send-code FAILURE", error.localizedDescription)
                }
            } receiveValue: { model in
                print("sms ketti", model.message)
            }.store(in: &cancelable)
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

struct SendCodeModel: Codable {
    let user: String?
    let message: String
}

enum HTTPURLRequestMethod: String {
    case post = "POST"
    case get = "GET"
}

extension Dictionary {
    func percentEncoded() -> Data? {
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
