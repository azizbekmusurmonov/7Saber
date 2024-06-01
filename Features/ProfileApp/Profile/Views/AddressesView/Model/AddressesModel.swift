//
//  AddressesViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 24/04/24.
//

import Foundation
import Combine

public class AddressesModel: ObservableObject {
    
    @Published public var items: [Item] = []
    public init() { }
   
}

public struct Item: Hashable {
    public var id = UUID().uuidString
    public let title: String
    public let location: String
    public let seeOnMap: String
}
