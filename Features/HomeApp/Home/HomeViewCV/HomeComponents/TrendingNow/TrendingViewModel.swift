//
//  TrendingViewModel.swift
//  Home
//
//  Created by islombek on 20/06/24.
//

import Foundation
import Combine

// MARK: - NetworkError Enum

enum TrendingNetworkError: Error {
    case invalidURL
    case serverError(String)
    case decodingFailed
    case unknown(Error)

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .serverError(let message):
            return "Server error: \(message)"
        case .decodingFailed:
            return "Failed to decode the response."
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

// MARK: - TrendingViewModel

class TrendingViewModel: ObservableObject {
    @Published var categories: Trending?
    @Published var isLoading = false
    @Published var error: TrendingNetworkError?

    private var cancellables = Set<AnyCancellable>()

    func fetchCategories() {
        isLoading = true
        fetchNewCollection()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.handleCompletion(completion)
            }, receiveValue: { [weak self] trendingnow in
                self?.handleSuccess(trendingnow)
            })
            .store(in: &cancellables)
    }

    private func fetchNewCollection() -> AnyPublisher<Trending, TrendingNetworkError> {
        guard let url = URL(string: "https://lab.7saber.uz/api/client/product?pageSize=15&page=1&type=2") else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    throw TrendingNetworkError.serverError("Invalid response from server.")
                }
                return data
            }
            .decode(type: Trending.self, decoder: JSONDecoder())
            .mapError { error in
                if let networkError = error as? TrendingNetworkError {
                    return networkError
                } else {
                    return .unknown(error)
                }
            }
            .eraseToAnyPublisher()
    }

    private func handleCompletion(_ completion: Subscribers.Completion<TrendingNetworkError>) {
        isLoading = false
        if case let .failure(error) = completion {
            self.error = error
        }
    }

    private func handleSuccess(_ trendingnow: Trending) {
        isLoading = false
        self.categories = trendingnow
    }
}
