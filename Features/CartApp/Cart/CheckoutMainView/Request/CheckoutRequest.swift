//
//  CheckoutRequest.swift
//  Cart
//
//  Created by Ismatillokhon on 02/07/24.
//

import NetworkManager
import Core
import Foundation

private let baseUrl = "https://lab.7saber.uz/api"

struct CheckoutRequest {
    
    static func getUser() async throws -> ProfileBundle {
        try await NetworkService.shared.request(
            url: "https://lab.7saber.uz/api/client/user/show/1",
            decode: ProfileBundle.self,
            method: .get
        )
    }
    
    static func getCart() async throws -> [CartModel] {
        try await NetworkService.shared.request(
            url: baseUrl + "/client/cart",
            decode: [CartModel].self,
            method: .get
        )
    }
    
    static func getAddress() async throws -> AddressModel {
        try await NetworkService.shared.request(
            url: baseUrl + "/client/address",
            decode: AddressModel.self,
            method: .get
        )
    }
    
    static func getTotalBalance(addressId: String?, promocodeId: String?) async throws -> TotalBalanceModel {
        try await NetworkService.shared.request(
            url: baseUrl + "/client/order/get-total-pice",
            decode: TotalBalanceModel.self,
            method: .post,
            body: ["addressId": addressId, "promocodeId": promocodeId]
        )
    }
}
