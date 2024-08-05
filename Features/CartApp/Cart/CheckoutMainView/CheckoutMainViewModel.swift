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
    @Published var paymentButtonIsEnable: Bool = false
    
    @Published var showAddressView: Bool = false
    @Published var showPaymentView: Bool = false
    
    @Published var carts: [Product] = []
    @Published var addressess: [AddressData] = []
    @Published var totalBalance: TotalBalanceModel? = nil
    
    // promocode
    @Published var promocode: String = ""
    @Published var showPromocode: Bool = false
    @Published var promocodeIsEnable: Bool = false
    @Published var didAppliedPromocode = false
    var selectedAddress: AddressResponseData?
    
    @Published var showAddCardView: Bool = false
    @Published var enteredCardNumber: String = ""
    @Published var enteredExpiredDate: String = ""
    @Published var enteredCVV: String = ""
    @Published var selctedCardType: String.CardType?
    @Published var canAddCard: Bool = false
    
    @Published var selectedPaymentMethod: SelectedPaymentMethod = .cash
    
    @Published var viewHeight: CGFloat = 626.dpHeight()
    
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
    
    func didApplyPromocode() {
        Task.detached { [weak self] in
            guard let self else { return }
            
            do {
                let model = try await NetworkService.shared.request(
                    url: "https://lab.7saber.uz/api/client/promocode/apply",
                    decode: ApiPromocode.self,
                    method: .post,
                    body: ["productIds": carts.map(\.id), "promocode" : promocode]
                )
                await MainActor.run {
                    if let newPromocode = model.promocode?.promocode {
                        self.promocode = newPromocode
                        self.message = .success(message: model.message)
                        self.didAppliedPromocode = true
                        self.showPromocode = false
                        self.checkPrice()
                    }
                }
            }
            catch {
                message = .error(message: error.localizedDescription)
            }
        }
    }
    
    func didTappedPayment() {
        Task.detached { [weak self] in
            guard let self else { return }
            
            do {
                let model = try await NetworkService.shared.request(
                    url: "https://lab.7saber.uz/api/client/promocode/apply",
                    decode: ApiPromocode.self,
                    method: .post,
                    body: ["productIds": carts.map(\.id), "promocode" : promocode]
                )
                await MainActor.run {
                    if let newPromocode = model.promocode?.promocode {
                        self.promocode = newPromocode
                        self.message = .success(message: model.message)
                        self.didAppliedPromocode = true
                        self.showPromocode = false
                    }
                }
            }
            catch {
                message = .error(message: error.localizedDescription)
            }
        }
    }
    
    func checkPrice() {
        isLoading = true
        
        Task.detached { [weak self] in
            guard let self else { return }
            do {
                let totalBalances = try await CheckoutRequest.getTotalBalance(
                    addressId: selectedAddress?.id?.description,
                    promocodeId: promocode
                )
                
                await MainActor.run { [weak self] in
                    self?.totalBalance = totalBalances
                    self?.isLoading = false
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.message = .error(message: error.localizedDescription)
                    self?.isLoading = false
                }
            }
        }
    }
}

// MARK: Card
extension CheckoutMainViewModel {
    func addCardPressed() {
        
    }
}
