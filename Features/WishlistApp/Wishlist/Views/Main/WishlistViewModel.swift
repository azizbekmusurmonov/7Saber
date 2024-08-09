//
//  WishlistViewModel.swift
//  Wishlist
//
//  Created by Ismatillokhon on 3/30/24.
//

import Foundation
import Combine
import NetworkManager

enum ShowMessage: Equatable {
    case success(message: String)
    case error(message: String)
}

final public class WishlistViewModel: ObservableObject {
    
    @Published var items: [GetWishlistModel] = []
    @Published var message: ShowMessage? = nil
    @Published var isLoading: Bool = false
    
    public init() {
        fetchWishlist()
    }
    
    func fetchWishlist() {
        isLoading = true
        let urlString = "https://lab.7saber.uz/api/client/favorite"
        Task.detached { [weak self] in
            do {
                let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: [GetWishlistModel].self,
                    method: .get
                )
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "Wishlist muvaffaqiyatli keldi")
                    self?.items = model
                    self?.isLoading = false
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .success(message: error.localizedDescription)
                    self?.isLoading = false  
                }
            }
        }
    }
}
