//
//  CheckoutMainViewModel.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import Foundation
import Combine
import NetworkManager
import Core

final class CheckoutMainViewModel: ObservableObject {
    
    @Published var showBagView: Bool = false
    @Published var userName: String = ""
    @Published var message: ShowMessage? = nil
    @Published var promocode: String = "74FE79G45"
    @Published var paymentButtonIsEnable: Bool = false
    
    init() {
        fetchProfile()
    }
    
    
    public func fetchProfile() {
        Task.detached {
            do {
                let profile = try await NetworkService.shared.request(
                    url: "https://lab.7saber.uz/api/client/user/show/1",
                    decode: ProfileBundle.self,
                    method: .get
                )
                await MainActor.run { [weak self] in
                    self?.userName = profile.role.name
                }
                
            } catch {
                self.message = .error(message: error.localizedDescription)
            }
        }
    }
    
}
