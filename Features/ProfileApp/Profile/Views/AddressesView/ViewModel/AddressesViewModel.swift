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
