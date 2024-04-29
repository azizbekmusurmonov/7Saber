//
//  OrderHistoryViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 27/04/24.
//

import SwiftUI
import Combine

public struct OrderHistoryViewModel: Hashable {
    let headertitle: String
    let cells: [Cells]
}

public struct Cells: Hashable {
    let orderId: String
    let total: String
}
