//
//  AddressesViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 15/05/24.
//

import SwiftUI
import Combine

public class AddressesViewModel: ObservableObject {
    
    public init() {}
    
    @Published var items: [Item] = [
        Item(title: "MY OFFICE",
             location: "Mukimiy st. 59, Tashkent, Uzbekistan",
             seeOnMap: "SEE ON MAP"
            ),
        Item(title: "MY OFFICE",
             location: "Mukimiy st. 59, Tashkent, Uzbekistan",
             seeOnMap: "SEE ON MAP"
            )
    ]
}

public class AddressFormViewModel: ObservableObject {
    
    @Published var addressName: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var streetAddress: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var building: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var apartment: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var floor: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var house: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var city: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var stateProvinceRegion: String = "" {
        didSet {
            checkToValied()
        }
    }
    @Published var zipcode: String = ""
    @Published var phoneNumber: String = ""
    
    @Published public var isFormValid: Bool = false
    
    public func checkToValied() {
        isFormValid = !addressName.isEmpty && !streetAddress.isEmpty && !city.isEmpty && !stateProvinceRegion.isEmpty
    }
    
    public init() {}
}
