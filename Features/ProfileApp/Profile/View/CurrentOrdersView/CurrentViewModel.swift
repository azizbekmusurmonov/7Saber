//
//  CurrentModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 01/05/24.
//

import SwiftUI
import Combine
import AssetKit

public struct CurrentViewModel: Hashable {
    let headertitle: String
    let cell: [Cell]
}

public struct Cell: Hashable {
    let orderId: String
    let total: String
}

