//
//  AddressesViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 24/04/24.
//

import Foundation
import Combine

public struct Item: Hashable {
    public var id = UUID().uuidString
    public let title: String
    public let location: String
    public let seeOnMap: String
    
    public init(id: String = UUID().uuidString, title: String, location: String, seeOnMap: String) {
        self.id = id
        self.title = title
        self.location = location
        self.seeOnMap = seeOnMap
    }
}

// Define the data structure returned by the API
public struct AddressResponseData: Decodable, Equatable {
    public let id: Int?
    public let name: String?
    public let countryId: String?
    public let street: String?
    public let building: String?
    public let appartment: String?
    public let floor: String?
    public let house: String?
    public let city: String?
    public let spr: String?
    public let zipcode: String?
    public let phone: String?
    public let email: String?
}

public struct AddressResponse: Decodable {
   public let success: Bool?
   public let message: String
   public let data: AddressResponseData?
   public let address: AddressResponseData?
}
