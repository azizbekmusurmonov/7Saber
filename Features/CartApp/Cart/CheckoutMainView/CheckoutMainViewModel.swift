//
//  CheckoutMainViewModel.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import Foundation
import Combine
import NetworkManager
import Core

final class CheckoutMainViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var showBagView: Bool = false
    @Published var userName: String = ""
    @Published var message: ShowMessage? = nil
    @Published var promocode: String = "74FE79G45"
    @Published var paymentButtonIsEnable: Bool = false
    
    @Published var carts: [Product] = []
    @Published var addressess: [AddressData] = []
    @Published var totalBalance: TotalBalanceModel? = nil
    
    init() {
        fetchAllData()
    }
    
    public func fetchAllData() {
        
        Task.detached {
            do {
                async let userData = CheckoutRequest.getUser()
                async let cartData = CheckoutRequest.getCart()
                async let address = CheckoutRequest.getAddress()
                async let totalBalances = CheckoutRequest.getTotalBalance(addressId: nil, promocodeId: nil)
                
                let (user, carts, addresses, totalBalance) = try await (userData, cartData, address, totalBalances)
                await MainActor.run { [weak self] in
                    self?.userName = user.role.name
                    self?.carts = carts.map { $0.getProduct }
                    self?.addressess = addresses.data
                    self?.totalBalance = totalBalance
                    self?.isLoading = false
                }
                
            } catch {
                self.message = .error(message: error.localizedDescription)
                self.isLoading = false
            }
        }
    }
}
