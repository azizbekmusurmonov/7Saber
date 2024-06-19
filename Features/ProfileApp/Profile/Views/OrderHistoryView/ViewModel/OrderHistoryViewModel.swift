//
//  OrderHistoryConstans.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 28/04/24.
//

import Foundation
import Combine

final class OrderHistoryViewModel: ObservableObject {
        
    @Published var orderHistoryData: [OrderHistoryModel] = [
        OrderHistoryModel(headertitle: "March 20, 2024",
                              cells: [
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .delivered),
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .canceled)
                              ]),
        OrderHistoryModel(headertitle: "March 20, 2024",
                              cells: [
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .delivered),
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .onProccess),
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .canceled)
                              ]),
        OrderHistoryModel(headertitle: "March 20, 2024",
                              cells: [
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .delivered),
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .canceled),
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .canceled)
                              ]),
        OrderHistoryModel(headertitle: "March 20, 2024",
                              cells: [
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .delivered),
                                Cells(orderId: "73489F27", total: "2 475 000 UZS", status: .canceled)
                              ]),
        
    ]
    
}
