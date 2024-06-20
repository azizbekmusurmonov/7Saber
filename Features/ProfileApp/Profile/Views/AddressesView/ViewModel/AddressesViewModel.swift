//
//  AddressesViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 15/05/24.
//

import SwiftUI
import Combine
import NetworkManager

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
    
    func sendAddresses() {
        let urlString = "https://lab.7saber.uz/api/client/address/store"
        
        Task.detached { [weak self] in
            guard let self, let url = URL(string: urlString) else { return }
            let adressesData: [String : String] = [
                "name" : addressName,
                "countryId" : "1",
                "street" : streetAddress,
                "building" : building,
                "appartment" : apartment,
                "floor" : floor,
                "house" : house,
                "city" : city,
                "spr" : stateProvinceRegion,
                "zipcode" : zipcode,
                "phone" : phoneNumber
            ]
            
            do {
                let responce: AddressResponse = try await NetworkService.shared.request(
                    url: urlString,
                    decode: AddressResponse.self,
                    method: .post,
                    body: adressesData
                )
                
                print("Address sent successfully: \(responce)")
            } catch {
                print("uplaod error ", error.localizedDescription)
            }
        }
    }
}
