//
//  CategoryViewModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import Foundation

// MARK: - CategoryElement
struct CategoryElement: Codable, Identifiable {
    let id: Int
    let nameUz, nameRu, nameEn: String
    let bg: Bg

    enum CodingKeys: String, CodingKey {
        case id, nameUz, nameRu, nameEn, bg
    }
}

// MARK: - Bg
struct Bg: Codable {
    let src: String
}

typealias Categoryy = [CategoryElement]



import Foundation
import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [CategoryElement] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchCategories()
    }

    func fetchCategories() {
        isLoading = true
        let urlString = "https://lab.7saber.uz/api/client/catalog?type=1"
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
            .decode(type: [CategoryElement].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.error = error
                    self?.isLoading = false
                }
            }, receiveValue: { [weak self] categories in
                self?.categories = categories
            })
            .store(in: &cancellables)
    }
}
