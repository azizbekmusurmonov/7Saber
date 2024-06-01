//
//  CurrentModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import Foundation
import Combine

final class CurrentViewModel: ObservableObject {
    
    @Published var currentData: [CurrentModel] = [
        CurrentModel(headertitle: "March 20, 2024",
                     cell: [
                        Cell(orderId: "73489F27", total: "2 475 000 UZS", status: .onProccess),
                        Cell(orderId: "73489F27", total: "2 475 000 UZS", status: .onProccess),
                        Cell(orderId: "73489F27", total: "2 475 000 UZS", status: .onProccess)
                     ])
    ]
    
}
