//
//  CartViewModel.swift
//  Cart
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

public struct Product: Identifiable {
    public let id = UUID()
    public let name: String
    public let price: Int
    public let discountedPrice: Int
    public let size: String
    public let color: String
    public var count: Int
}

public final class CartViewModel: ObservableObject {
    
    @Published var products: [Product] = [] {
        didSet {
            recalculateTotalPrice()
        }
    }
    
    @Published var totalPrice: Int = 0
    @Published var message: ShowMessage? = nil
    
    public init() {
        recalculateTotalPrice()
        getCart()
    }
    
    private func recalculateTotalPrice() {
        totalPrice = products.reduce(0) { $0 + ($1.price * $1.count) }
    }
    
    func formattedTotalPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
    
    func increaseCount(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].count += 1
            recalculateTotalPrice()
        }
    }
       
    func decreaseCount(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }), products[index].count > 0 {
            products[index].count -= 1
            recalculateTotalPrice()
        }
    }
    
    func getCart() {
        let urlString = "https://lab.7saber.uz/api/client/cart"
        
        Task.detached { [weak self] in
            
            do {
                let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: [CartModel].self,
                    method: .get,
                    queryParameters: ["page": 1.description, "pageSize": 15.description]
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "CART muvaffaqiyatli keldi")
//                    self?.products = model
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .success(message: error.localizedDescription)
                }
            }
        }
    }
    
    func updateCart() {
        
        let urlString = "https://lab.7saber.uz/api/client/cart/update"
        
        Task.detached { [weak self] in
            guard self != nil else { return }
            
            do {
                // Используем копию urlComponents
                let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: UpdateModel.self,
                    method: .post
//                    body: [type.rawValue: self?.numberText ?? ""]
                )
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "")
                }
                
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .success(message: error.localizedDescription)
                }
            }
        }
    }
}
