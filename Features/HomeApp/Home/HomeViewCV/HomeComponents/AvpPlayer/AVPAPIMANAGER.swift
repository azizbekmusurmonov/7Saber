//
//  AVPAPIMANAGER.swift
//  Home
//
//  Created by islombek on 25/06/24.
//

import Foundation
import Combine
import NetworkManager

class APIManager: ObservableObject {
    @Published var playerData: AVPplayer? = nil
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchData()
    }

    func fetchData() {
        isLoading = true
        let urlString = "https://lab.7saber.uz/api/client/banner/hero-slider"
    
        Task.detached { [weak self] in
            guard let self else { return }
            
            do {
                let model = try await NetworkService.shared.request(url: urlString, decode: AVPplayer.self, method: .get)
                
                await MainActor.run {
                    self.isLoading = false
                    self.playerData = model
                }
            } catch {
                self.error = error
            }
        }
    }
}


