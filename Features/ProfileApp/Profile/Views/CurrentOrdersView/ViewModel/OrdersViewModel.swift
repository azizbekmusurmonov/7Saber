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
    @Published var viewState: ViewState = .loading
    @Published var message: MessageShow? = nil
    
    public init() {
        fetchOrderHistory()
    }
    
    public func fetchOrderHistory() {
        viewState = .loading
        Task.detached {
            do {
                let history = try await NetworkService.shared.request(
                    url: "https://lab.7saber.uz/api/client/order",
                    decode: OrderTypeModel.self,
                    method: .get
                )
                let mappedHistory = history.data.map { orderId in
                    OrdersModel(headertitle: "Order \(orderId)", cells: [
                        Cell(orderId: orderId, total: "Total Placeholder", status: .onProccess)
                    ])
                }
                await MainActor.run { [weak self] in
                    self?.ordersData = mappedHistory
                    self?.viewState = mappedHistory.isEmpty ? .empty : .show
                    self?.message = .succes(message: "Muvaffaqqiyatli")
                }
            } catch {
                print("Failed to fetch order history:", error)
                await MainActor.run { [weak self] in
                    self?.viewState = .show
                    self?.message = .error(message: "Muvaffaqqiyatsiz")
                }
            }
        }
        
    }
    
}

public class CurrentBottomViewModel: ObservableObject {
    
    public init() {}
    
    @Published var products: [Products] = [
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS"),
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS"),
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS"),
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS")
    ]
}

enum Progresses {
    case orderedPaid
    case accepted
    case shipped
    case delivired
}
