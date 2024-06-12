//
//  PersonalInfoViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 24/04/24.
//

import SwiftUI
import Combine
import NetworkManager

public class PersonalInfoViewModel: ObservableObject {
    @Published var fullNam: String = ""
    @Published var phoneNamber: String = ""
    @Published var email: String = ""
    @Published var gender: String = ""
    @Published var birthDate: String = ""
    @Published var profileImage: UIImage? = nil
    
    public init() { }
    
    func sendPersonalInfo() async {
        let urlString = "https://lab.7saber.uz/api/client/user/update"
        
//        Task.detached { [weak self] in
//            guard self != nil else { return }
//            
//            do {
//                // Используем копию urlComponents
//                let model = try await NetworkService.shared.request(
//                    url: urlString,
//                    decode: PersonalInfoModel.self,
//                    method: .post,
//                    body: ["fullName" : fullNam]
//                )
//                await MainActor.run { [weak self] in
////                    self?.startTimer()
////                    self?.message = .success(message: model.message)
//                }
//                
//            } catch {
//                await MainActor.run { [weak self] in
////                    self?.message = .success(message: error.localizedDescription)
//                }
//            }
//        }
    }
}
