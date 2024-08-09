//
//  OrdersViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 20/06/24.
//

import Foundation
import Combine
import Core
import NetworkManager
import AssetKit

final class OrdersViewModel: ObservableObject {
    
    @Published var ordersData: [OrdersModel]? = nil
    @Published var products: [Products]? = nil
    @Published var viewState: ViewState = .loading
    @Published var message: MessageShow? = nil
    
    public init() {
        fetchOrders()
    }
    
    public func fetchOrders() {
        viewState = .loading
        Task.detached {
            do {
                let data = try await NetworkService.shared.request(
                    url: "https://lab.7saber.uz/api/client/order",
                    decode: OrderTypeModel.self,
                    method: .get
                )
                
                await MainActor.run { [weak self] in
                    let orders = data.data.map { string in
                        return OrdersModel(headertitle: string, cells: [])
                    }
                    self?.ordersData = orders
                    self?.viewState = .show
                    self?.message = .succes(message: "Muvaffaqqiyatli")
                }
            } catch {
                print("Failed to fetch order history:", error)
                await MainActor.run { [weak self] in
                    self?.viewState = .empty
                    self?.message = .error(message: "Muvaffaqqiyatsiz")
                }
            }
        }
    }
}

enum Progresses {
    case orderedPaid
    case accepted
    case shipped
    case delivired
}
