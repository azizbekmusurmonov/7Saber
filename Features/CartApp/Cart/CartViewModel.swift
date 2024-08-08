//
//  CartViewModel.swift
//  Cart
//
//  Created by Ismatillokhon on 3/30/24.
//

import Foundation
import Combine
import NetworkManager
import Core

enum ShowMessage: Equatable {
    case success(message: String)
    case error(message: String)
}

enum CardDiscount {
    case minus
    case plus
}

public final class CartViewModel: ObservableObject {
    
    @Published var products: [CartModel] = []
    
    @Published var qty: Int = 0
    @Published var overallSum: String = ""
    @Published var totalPrice: Int = 0
    @Published var message: ShowMessage? = nil
    @Published var checkoutHeight: CGFloat = 625.dpHeight()
    
    public init() {
        getCart()
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
                    self?.products = model
                    self?.totalSum()
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .success(message: error.localizedDescription)
                }
            }
        }
    }
    
    func updateCart(discount: CardDiscount) {
        
        switch discount {
        case .minus:
            minusQty()
        case .plus:
            plusQty()
        }
        
        let urlString = "https://lab.7saber.uz/api/client/cart/update"
        
        Task.detached { [weak self] in
            guard let self = self else { return }
            
            for product in self.products {
                do {
                    let requestBody: [String: Any] = [
                        "id": product.id,
                        "productId": product.product.id,
                        "qty": product.qty,
                        "details": [
                            "colorId": product.product.attribute.colorID,
                            "size": product.product.attribute.size
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
                            self?.plusQty()
                        case .plus:
                            self?.minusQty()
                        }
                    }
                }
            }
        }
    }
    
    func deleteCart() {
        let urlString = "https://lab.7saber.uz/api/client/cart/destroy/1"
        
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
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                }
            }
        }
    }

    func plusQty() {
        
        for index in 0..<products.count {
            products[index].qty += 1
            self.qty = products[index].qty
        }
        
        totalSum()
    }
    
    func minusQty() {
        
        for index in 0..<products.count {
            if products[index].qty == 0 {
                deleteCart()
            } else {
                products[index].qty -= 1
                self.qty = products[index].qty
            }
        }
        
        totalSum()
    }
    
    func totalSum() {
        var sum = 0

        for product in products {
            sum += product.product.price.value * product.qty
        }

        overallSum = sum.description 
    }
}
