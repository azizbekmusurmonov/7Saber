//
//  OrderHistoryConstans.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 28/04/24.
//

import SwiftUI

struct OrderHistoryConstans {
    
    static let shared = OrderHistoryConstans()
    
    let orderHistoryData: [OrderHistoryViewModel] = [
        OrderHistoryViewModel(headertitle: "March 20, 2024",
                              cells: [
                                  Cells(orderId: "73489F27", total: "2 475 000 UZS"),
                                  Cells(orderId: "73489F27", total: "2 475 000 UZS")
                              ])
    ]
    
}
