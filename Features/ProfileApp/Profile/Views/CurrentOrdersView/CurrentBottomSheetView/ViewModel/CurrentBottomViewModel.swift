//
//  CurrentBottomViewModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 31/05/24.
//

import SwiftUI
import AssetKit

public class CurrentBottomViewModel: ObservableObject {
    
    public init() {}
    
    @Published var products: [Products] = [
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS"),
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS"),
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS"),
        Products(
            productName: "T-shirt Basic",
            image: Asset.Image.BankImage.agrobank.image,
            size: "L",
            quantity: "2",
            color: "Dark Blue",
            price: "320 000 UZS")
    ]
}
