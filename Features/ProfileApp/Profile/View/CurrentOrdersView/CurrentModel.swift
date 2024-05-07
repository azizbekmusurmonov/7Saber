//
//  CurrentModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import Foundation
import Combine

final class CurrentModel: ObservableObject {
        
    @Published var currentData: [CurrentViewModel] = [
        CurrentViewModel(headertitle: "March 20, 2024",
                              cell: [
                                Cell(orderId: "73489F27", total: "2 475 000 UZS"),
                                Cell(orderId: "73489F27", total: "2 475 000 UZS"),
                                Cell(orderId: "73489F27", total: "2 475 000 UZS")
                              ])
    ]
    
}
