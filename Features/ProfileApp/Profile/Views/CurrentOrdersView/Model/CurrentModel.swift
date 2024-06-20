//
//  CurrentModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 01/05/24.
//

import SwiftUI
import Combine
import AssetKit

public struct CurrentModel: Hashable {
    let headertitle: String
    let cell: [Cell]
}

public struct Cell: Hashable {
    let orderId: String
    let total: String
    let status: CurrentOrderStatus
}

enum CurrentOrderStatus: String {
    case delivered = "DELIVERED"
    case onProccess = "ONPROGREES"
    case canceled
    
    var color: Color {
        switch self {
        case .delivered: return Asset.Color.Chips.Status.delivired.swiftUIColor
        case .onProccess: return Asset.Color.Chips.Status.onProccess.swiftUIColor
        case .canceled: return Asset.Color.Chips.Status.canceled.swiftUIColor
        }
    }
    
    var icon: UIImage {
        switch self {
        case .delivered: return Asset.Image.Icons.doneGreen.image
        case .onProccess: return Asset.Image.Icons.proccess.image
        case .canceled: return Asset.Image.Icons.closeRed.image
        }
    }
    
    var textColor: Color {
        switch self {
        case .delivered: return Asset.Color.Text.Status.deliviredCol.swiftUIColor
        case .onProccess: return Asset.Color.Text.Status.proccessCol.swiftUIColor
        case .canceled: return Asset.Color.Text.Status.canceledCol.swiftUIColor
        }
    }
}
