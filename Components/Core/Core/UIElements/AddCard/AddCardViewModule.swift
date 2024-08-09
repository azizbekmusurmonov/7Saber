//
//  AddCardViewModule.swift
//  Core
//
//  Created by Ismatillokhon on 08/08/24.
//

import Foundation
import NetworkManager
import Payze_iOS_sdk

final class AddCardViewModule: ObservableObject {
    
    @Published var enteredCardNumber: String = ""
    @Published var enteredCardName: String = ""
    @Published var enteredExpiredDate: String = ""
    @Published var enteredCVV: String = ""
    @Published var selctedCardType: String.CardType?
    @Published var canAddCard: Bool = false
    @Published var addCardResult: Result<StartPaymentResponse, Error>?
    
    
    func didEnterAdd() {
        
        NetworkService.shared.getTransactionID { [weak self] transaction in
            
            guard let self,  let paymentDetails = PaymentDetails.init(
                number: enteredCardNumber.replacingOccurrences(of: " ", with: ""),
                cardHolder: enteredCardName,
                expirationDate: enteredExpiredDate,
                securityNumber: "",
                transactionId: transaction.transactionID,
                billingAddress: ""
            )
            else { return }
            
            PaymentService.shared.startPayment(paymentDetails: paymentDetails) { [weak self] result in
                self?.addCardResult = result
            }
        }
    }
}
