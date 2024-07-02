//
//  AddressesViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 15/05/24.
//

import SwiftUI
import Combine
import NetworkManager
import Core

public class AddressesViewModel: ObservableObject {
    
    public init() {
        fetchAddresses()
    }
    
    @Published var items: [Item]? = nil
    @Published var viewState: ViewState = .loading
    @Published var message: MessageShow? = nil
    
    public func fetchAddresses() {
        viewState = .loading
        Task {
            do {
                let adresses = try await NetworkService.shared.request(
                    url: "https://lab.7saber.uz/api/client/address/show/1",
                    decode: AddressModel.self,
                    method: .get
                )
               // let item = self.mapAddressToItem(address: adresses)
                await MainActor.run { [weak self] in
                    self?.items = []
                    self?.viewState = self?.items?.isEmpty == true ? .empty : .show
                    self?.message = .succes(message: "Sizning manzilingiz muvaffaqqiyatli!")
                }
            } catch {
                print("Failed to fetch addresses:", error)
                await MainActor.run { [weak self] in
                    self?.viewState = .show
                    self?.message = .error(message: "Sizning manzilingiz muvaffaqqiyatsiz")
                }
            }
        }
    }
    
    private func mapAddressToItem(address: Datum) -> Item {
        return Item(
            title: address.name,
            location: "", // "\(address.) st. \(address.building), \(address.city), \(address.country.name)",
            seeOnMap: "SEE ON MAP"
        )
    }
}


public class AddressFormViewModel: ObservableObject {
    
    @Environment(\.dismiss) var pop
    
    @Published var addressName: String = "" {
        didSet {
            checkToValied()
        }
    }
    
    @Published var countries: [CountryModel] = [] {
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
    @Published var zipcode: String = "" {
        didSet {
                checkToValied()
        }
    }
    @Published var phoneNumber: String = ""
    @Published var selectedCountry: CountryModel? = nil
    @Published public var isFormValid: Bool = false
    
    @Published var message: MessageShow? = nil
    
    public func checkToValied() {
        isFormValid = !addressName.isEmpty && !streetAddress.isEmpty && !city.isEmpty && !stateProvinceRegion.isEmpty
    }
    
    public init() {
        getCountries()
    }
    
    func sendAddresses() {
        let urlString = "https://lab.7saber.uz/api/client/address/store"
        
        Task.detached { [weak self] in
            guard let self, let url = URL(string: urlString) else { return }
            let adressesData: [String : String] = [
                "name" : addressName,
                "countryId" : selectedCountry?.id.description ?? "1",
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
                await MainActor.run { [weak self] in
                    pop()
                    self?.message = .succes(message: "Sizning manzilingiz muvaffaqqiyatli yuborildi")
                }
            } catch {
                print("uplaod error ", error.localizedDescription)
                await MainActor.run { [weak self] in
                    self?.message = .error(message: "Sizning manzilingiz muvaffaqqiyatli yuborilmadi")
                }
            }
        }
    }
    
    private func getCountries() {
        let url = "https://lab.7saber.uz/api/client/country"
        Task.detached { [weak self] in
            guard let self else { return }
            
            do {
                let model = try await NetworkService.shared.request(url: url, decode: [CountryModel].self, method: .get)
                
                await MainActor.run {
                    self.countries = model
                }
                
            } catch {
                message = .error(message: error.localizedDescription)
            }
        }
    }
}
