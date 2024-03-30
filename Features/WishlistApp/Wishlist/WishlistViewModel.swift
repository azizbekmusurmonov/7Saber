//
//  WishlistViewModel.swift
//  Wishlist
//
//  Created by Ismatillokhon on 3/30/24.
//

import Foundation
import Combine

final public class WishlistViewModel: ObservableObject {
    
    @Published var text = "Salom"
    
    public init() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.text = "sdkjbchksejcbksdjcnksdjmcn;bNc;oIdhco;waiesbvc"
        }
    }
}
