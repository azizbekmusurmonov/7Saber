//
//  AVPAPIMANAGER.swift
//  Home
//
//  Created by islombek on 25/06/24.
//

import Foundation
import Combine

class APIManager: ObservableObject {
    @Published var players: [AVPplayer] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchData()
    }

    func fetchData() {
        isLoading = true
        let urlString = "https://lab.7saber.uz/api/client/banner/hero-slider"
        guard let url = URL(string: urlString) else {
            error = URLError(.badURL)
            isLoading = false
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [AVPplayer].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.error = error
                    self?.isLoading = false
                }
            }, receiveValue: { [weak self] players in
                self?.players = players
            })
            .store(in: &cancellables)
    }
}


