//
//  TrendingViewModel.swift
//  Home
//
//  Created by islombek on 20/06/24.
//

import Foundation





import SwiftUI
import Combine
import Core
import NetworkManager

public class TrendingViewModel: ObservableObject {
    
    private var fetchTask: Task<Void, Never>?
    
    @Published var newCollection: Trending?
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
                let urlString = "https://lab.7saber.uz/api/client/product?pageSize=15&page=1&type=2"
                let newCollection = try await NetworkService.shared.request(
                    url: urlString,
                    decode: Trending.self,
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
