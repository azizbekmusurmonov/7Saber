//
//  CartViewModel.swift
//  Cart
//
//  Created by Ismatillokhon on 3/30/24.
//

import Foundation
import Combine

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
    
    @Published var products: [Product] = [
        Product(name: "Product 1", price: 1000000, discountedPrice: 1300000, size: "41", color: "Dark green", count: 1),
        Product(name: "Product 2", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 3", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 4", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 5", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 6", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 7", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 8", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 9", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1),
        Product(name: "Product 10", price: 1000000, discountedPrice: 1500000, size: "42", color: "Black", count: 1)
    ] {
        didSet {
            recalculateTotalPrice()
        }
    }
    
    @Published var totalPrice: Int = 0
    
    public init() {
        recalculateTotalPrice()
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
}
