//
//  CurrentBottomModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 31/05/24.
//

import SwiftUI

public class OrderedProductModel: ObservableObject {
    
    @Published public var products: [Products] = []
    public init() { }
}

public struct Products: Hashable {
    public var id = UUID().uuidString
    public let productName: String 
    public let image: UIImage
    public let size: String
    public let quantity: String
    public let color: String
    public let price: String
}
