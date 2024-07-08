//
//  WishlistViewModel.swift
//  Wishlist
//
//  Created by Ismatillokhon on 3/30/24.
//

import Foundation
import Combine

final public class WishlistViewModel: ObservableObject {
    
    @Published var items: [Item] = [
        Item(imageURL: URL(string: "https://images.uzum.uz/cof0s4a1om4pepe05dsg/original.jpg")!, 
             itemName: "T-shirt Basic", itemPrice: "120,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cgohb17g49devoad2r7g/original.jpg")!, itemName: "Another Item", itemPrice: "100,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cgpt0hfg49devoadb7ng/original.jpg")!, itemName: "Yet Another Item", itemPrice: "150,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cntrtiepom4ma10q7h3g/t_product_540_high.jpg")!, itemName: "One More Item", itemPrice: "90,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cm01etb2psag1e8tt8d0/original.jpg")!, itemName: "Last Item", itemPrice: "80,000 som")
    ]
    
    public init() { }
}
