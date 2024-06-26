//
//  ViewModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import Foundation

public enum NetworkError: LocalizedError {
    case invalidURL
    case requestFailed(description: String)
    case invalidResponse
    case decodingError(description: String)

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .requestFailed(let description):
            return "Network request failed: \(description)"
        case .invalidResponse:
            return "The server response was invalid."
        case .decodingError(let description):
            return "Failed to decode data: \(description)"
        }
    }
}



import SwiftUI
import Combine
import Core
import NetworkManager

public class NewCollectionViewModel: ObservableObject {
    
    private var fetchTask: Task<Void, Never>?
    
    @Published var newCollection: NewCollection?
    @Published var isLoading = false
    
    public init() {
        startFetchingData()
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
                let urlString = "https://lab.7saber.uz/api/client/product?pageSize=15&page=1&type=1"
                let newCollection = try await NetworkService.shared.request(
                    url: urlString,
                    decode: NewCollection.self,
                    method: .get
                )
                DispatchQueue.main.async {
                    self.newCollection = newCollection
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print("Error fetching new collection: \(error.localizedDescription)")
            }
        }
    }
    
    deinit {
        fetchTask?.cancel()
    }
}
