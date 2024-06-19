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
}

// Define the data structure returned by the API
struct AddressResponseData: Decodable {
    let id: Int
    let name: String
    let countryId: Int
    let street: String
    let building: String
    let apartment: String
    let floor: String
    let house: String
    let city: String?
    let spr: String
    let zipcode: String
    let phone: String?
    let email: String?
}

struct AddressResponse: Decodable {
    let success: Bool
    let message: String
    let data: AddressResponseData
}
