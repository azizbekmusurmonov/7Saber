//
//  AddCardViewModule.swift
//  Core
//
//  Created by Ismatillokhon on 08/08/24.
//

import Foundation

final class AddCardViewModule: ObservableObject {
    
    @Published var showAddCardView: Bool = false
    @Published var enteredCardNumber: String = ""
    @Published var enteredExpiredDate: String = ""
    @Published var enteredCVV: String = ""
    @Published var selctedCardType: String.CardType?
    @Published var canAddCard: Bool = false
    
}
