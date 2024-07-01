//
//  ProfileView.swift
//  Profile
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Combine
import AssetKit
import NetworkManager
import Core

public class ProfileViewModel: ObservableObject {
    
    @Published var profileData: ProfileBundle? = nil
    @Published var isLoading: Bool = false
    
    @Published var message: MessageShow? = nil
        
    public init() { 
        fetchProfile()
    }
    
    public func fetchProfile() {
        isLoading = true
        Task.detached {
            do {
                let profile = try await NetworkService.shared.request(
                    url: "https://lab.7saber.uz/api/client/user/show/1",
                    decode: ProfileBundle.self,
                    method: .get
                )
                await MainActor.run { [weak self] in
                    self?.profileData = profile
                    self?.isLoading = false
                    self?.message = .succes(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli keldi!")
                }
                
            } catch {
                print("Failed to fetch profile:", error)
                await MainActor.run { [weak self] in
                    self?.message = .error(message: "Sizning ma'lumotlaringiz muvaffaqqiyatli kelmadi!")
                }
            }
        }
    }
}
