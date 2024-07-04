//
//  ProductShow.swift
//  Home
//
//  Created by islombek on 24/05/24.
//

//import Foundation
//import Combine
//
//// MARK: - NetworkError Enum
//
//enum ShoesNetworkError: Error {
//    case invalidURL
//    case serverError(String)
//    case decodingFailed
//    case unknown(Error)
//
//    var localizedDescription: String {
//        switch self {
//        case .invalidURL:
//            return "Invalid URL."
//        case .serverError(let message):
//            return "Server error: \(message)"
//        case .decodingFailed:
//            return "Failed to decode the response."
//        case .unknown(let error):
//            return "Unknown error: \(error.localizedDescription)"
//        }
//    }
//}
//
//// MARK: - TrendingViewModel
//
//class ShoesViewModel: ObservableObject {
//    @Published var categories: Shoes?
//    @Published var isLoading = false
//    @Published var error: ShoesNetworkError?
//
//    private var cancellables = Set<AnyCancellable>()
//
//    func fetchCategories() {
//        isLoading = true
//        fetchNewCollection()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] completion in
//                self?.handleCompletion(completion)
//            }, receiveValue: { [weak self] shoes in
//                self?.handleSuccess(shoes)
//            })
//            .store(in: &cancellables)
//    }
//
//    private func fetchNewCollection() -> AnyPublisher<Shoes, ShoesNetworkError> {
//        guard let url = URL(string: "https://lab.7saber.uz/api/client/product?pageSize=15&page=1&category=1") else {
//            return Fail(error: .invalidURL).eraseToAnyPublisher()
//        }
//
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .tryMap { data, response in
//                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
//                    throw ShoesNetworkError.serverError("Invalid response from server.")
//                }
//                return data
//            }
//            .decode(type: Shoes.self, decoder: JSONDecoder())
//            .mapError { error in
//                if let networkError = error as? ShoesNetworkError {
//                    return networkError
//                } else {
//                    return .unknown(error)
//                }
//            }
//            .eraseToAnyPublisher()
//    }
//
//    private func handleCompletion(_ completion: Subscribers.Completion<ShoesNetworkError>) {
//        isLoading = false
//        if case let .failure(error) = completion {
//            self.error = error
//        }
//    }
//
//    private func handleSuccess(_ shoes: Shoes) {
//        isLoading = false
//        self.categories = shoes
//    }
//}
//

import SwiftUI
import Combine
import Core
import NetworkManager

public class ShoesViewModel: ObservableObject {
    
    private var fetchTask: Task<Void, Error>?
    
    @Published var categories: Shoes?
    @Published var isLoading = false
    
    public init() {
//        startFetchingData()
    }
    
 
    
    public func startFetchingData() {
        isLoading = true
        fetchTask = Task {
            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
            do {
                let urlString = "https://lab.7saber.uz/api/client/product?pageSize=15&page=1&category=1"
                let shoes = try await NetworkService.shared.request(
                    url: urlString,
                    decode: Shoes.self,
                    method: .get)
                DispatchQueue.main.async {
                    self.categories = shoes
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print(error.localizedDescription)
            }
        }
    }
    
    deinit {
        fetchTask?.cancel()
    }
}


