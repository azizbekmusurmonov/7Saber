//
//  HomeViewModel.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 28/06/24.
//

import Foundation
import Combine
import NetworkManager

enum ShowMessage: Equatable {
    case success(message: String)
    case error(message: String)
}

public final class HomeViewModel: ObservableObject {
    
    @Published var categories: [CategoriesModel] = []
    
    @Published var newCollectionData: [NewCollectionDatum] = []
    
    @Published var showSearchBar: Bool = false
    @Published var searchText: String = ""
    @Published var message: ShowMessage? = nil
    @Published var playerData: AVPplayer? = nil
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
 
    public init() { 
        fetchData()

    }
    
    func fetchData() {
        isLoading = true
        let urlString = "https://lab.7saber.uz/api/client/banner/hero-slider"
    
        Task.detached { [weak self] in
            guard let self else { return }
            
            do {
                async let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: AVPplayer.self,
                    method: .get
                )
                
                async let categories = try await getCategories()
                async let collectionsData = try await getNewCollection()
                
                let (model1, categoriesModel, collectionsDataModel) = try await (model, categories, collectionsData)
                
                await MainActor.run {
                    self.isLoading = false
                    self.playerData = model1
                    self.categories = categoriesModel
                    self.newCollectionData = collectionsDataModel
                }
            } catch {
                self.error = error
            }
        }
    }
    
    func getCategories() async throws -> [CategoriesModel] {
        try await NetworkService.shared.request(
            url:  "https://lab.7saber.uz/api/client/catalog?type=1",
            decode: [CategoriesModel].self,
            method: .get
        )
    }
    
    func getNewCollection() async throws -> [NewCollectionDatum] {
        try await NetworkService.shared.request(
            url: "https://lab.7saber.uz/api/client/product?pageSize=15&page=1&type=1",
            decode: NewCollectionModel.self,
            method: .get
        ).data
    }
}
