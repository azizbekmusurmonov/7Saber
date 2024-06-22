//
//  ViewModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import Foundation
import Combine


enum NetworkError: Error, LocalizedError {
    case invalidURL
    case decodingFailed
    case serverError(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .decodingFailed:
            return "Failed to decode the response."
        case .serverError(let message):
            return "Server error: \(message)"
        }
    }
}


class NewCollectionViewModel: ObservableObject {
    @Published var categories: NewCollection? = nil
    @Published var isLoading: Bool = false
    @Published var error: NetworkError? = nil

    private var cancellables = Set<AnyCancellable>()

    func fetchCategories() {
        isLoading = true
        fetchNewCollection()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.handleCompletion(completion)
            }, receiveValue: { [weak self] newCollection in
                self?.handleSuccess(newCollection)
            })
            .store(in: &cancellables)
    }

    private func fetchNewCollection() -> AnyPublisher<NewCollection, NetworkError> {
        guard let url = URL(string: "https://lab.7saber.uz/api/client/product?pageSize=15&page=1&type=1") else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    throw NetworkError.serverError("Invalid response from server.")
                }
                return data
            }
            .decode(type: NewCollection.self, decoder: JSONDecoder())
            .mapError { error in
                if let networkError = error as? NetworkError {
                    return networkError
                } else {
                    return .decodingFailed
                }
            }
            .eraseToAnyPublisher()
    }

    private func handleCompletion(_ completion: Subscribers.Completion<NetworkError>) {
        isLoading = false
        if case let .failure(error) = completion {
            self.error = error
        }
    }

    private func handleSuccess(_ newCollection: NewCollection) {
        isLoading = false
        self.categories = newCollection
    }
}
