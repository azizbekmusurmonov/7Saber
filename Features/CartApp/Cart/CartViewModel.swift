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

enum CardDiscount {
    case minus
    case plus
}

public final class CartViewModel: ObservableObject {
    
    @Published var products: [Cart] = CartMockData.data
    
    @Published var qty: Int = 0
    @Published var overallSum: String = ""
    @Published var totalPrice: Int = 0
    @Published var searchText: String = ""
    @Published var message: ShowMessage? = nil
    @Published var showSearchBar = false
    
    @Published var isCartEmpty: Bool = false
    
    public init() {
//        getCart()
    }
    
    func getCart() {
        let urlString = "https://lab.7saber.uz/api/client/cart"
        
        Task.detached { [weak self] in
            
            do {
                let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: CartModel.self,
                    method: .get,
                    queryParameters: ["page": 1.description, "pageSize": 15.description]
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "CART muvaffaqiyatli keldi")
                    self?.products = model.data
                    self?.totalSum()
                    self?.checkIfCartIsEmpty()
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .success(message: error.localizedDescription)
                }
            }
        }
    }
    
    func updateCart(discount: CardDiscount, index: Int) {
        switch discount {
        case .minus:
            minusQty(index: index)
        case .plus:
            plusQty(index: index)
        }
        
        let urlString = "https://lab.7saber.uz/api/client/cart/update"
        
        Task.detached { [weak self] in
            guard let self = self else { return }
            
            do {
                let product = self.products[index]
                let requestBody: [String: Any] = [
                    "id": product.id,
                    "productId": product.productID,
                    "qty": product.qty,
                    "details": [
                        "colorId": product.details.colorID,
                        "size": product.details.size
                    ]
                ]
                
                let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: CheckSuccessModel.self,
                    method: .post,
                    body: requestBody
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "Update successful")
                    self?.totalSum()
                }
                
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                    switch discount {
                    case .minus:
                        self?.plusQty(index: index)
                    case .plus:
                        self?.minusQty(index: index)
                    }
                }
            }
        }
    }
    
    func deleteCart(productId: Int) {
        let urlString = "https://lab.7saber.uz/api/client/cart/destroy/\(productId)"
        
        Task.detached { [weak self] in
            
            do {
                let model = try await NetworkService.shared.request(
                    url: urlString,
                    decode: CheckSuccessModel.self,
                    method: .delete
                )
                
                await MainActor.run { [weak self] in
                    self?.message = .success(message: "CART muvaffaqiyatli ochirildi")
                    self?.getCart()
                    self?.checkIfCartIsEmpty()
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                }
            }
        }
    }

    func plusQty(index: Int) {
        products[index].qty += 1
        totalSum()
    }
    
    func minusQty(index: Int) {
        if products[index].qty > 0 {
            products[index].qty -= 1
        }
        if products[index].qty == 0 {
            deleteCart(productId: products[index].id)
        }
        totalSum()
    }
    
    func totalSum() {
        var sum = 0

        for product in products {
            if let price = product.product.price["uzs"] as? Int {
                sum += price * product.qty
            }
        }

        overallSum = "\(sum)"
    }
    
    func checkIfCartIsEmpty() {
        isCartEmpty = products.isEmpty
    }
}
