//
//  ViewModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import Foundation
import Combine


public class NewCollectionViewModel: ObservableObject {
    
    @Published var newCollectionProducts: [ProductModel] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()

    func fetchProducts() {
        isLoading = true
        let urlString = "https://lab.7saber.uz/api/client/category"
        guard let url = URL(string: urlString) else {
            error = URLError(.badURL)
            isLoading = false
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .receive(on: RunLoop.main)
            .decode(type: [ProductModel].self, decoder: JSONDecoder())
            
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                    print("Data successfully completed ✳️")
                case .failure(let error):
                    self?.error = error
                    self?.isLoading = false
                    print("Data completed with failure 🆘: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] products in
                DispatchQueue.main.async {
                    self?.newCollectionProducts = products
                }
                
            })
            .store(in: &cancellables)
    }
}

