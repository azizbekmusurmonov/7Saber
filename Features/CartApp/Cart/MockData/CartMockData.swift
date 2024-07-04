//
//  CartMockData.swift
//  Cart
//
//  Created by Ismatillokhon on 28/06/24.
//

import Foundation
import Core

final class CartMockData {
//    static let product = ProductModel(
//        id: UUID().hashValue, catalogID: UUID().hashValue, categoryID: UUID().hashValue,
//        sportTypeID: UUID().hashValue, nameUz: "Product", nameRu: "Product", nameEn: "Profuct",
//        descUz: "Description", descRu: "Description", descEn: "Description", specUz: "specUz", specRu: "specRu", 
//        specEn: "specRu", sku: "", discount: [], price: ["price" : 100000], gender: "male", mainImgID: 0,
//        mediaID: "", clientMediaIDS: "", weight: 0, type: 0, isActive: true, additions: [], createdAt: "",
//        updatedAt: "", name: "Ismatillo", desc: "Marufkhonov", attributes: [
//            CartAttribute(productID: UUID().hashValue, billzID: "", barcode: 0, colorID: 0, size: "XS", photos: [""], qty: 0, createdAt: "", updatedAt: "",
//                          color: .init(id: UUID().hashValue, billzID: "", nameUz: "Color", nameRu: "Color", nameEn: "Color", hex: "#FF0000", createdAt: "", updatedAt: "", name: "Red Color")
//                         )
//        ],
//        mainImg: .init(id: 0, src: "https://7saber.uz/storage/product/12067ZXHeCc4CwRurnTZP.jpg", type: ""), media: "")
//    
//    static let data: [CartModel] = [
//        Cart(id: UUID().hashValue, userID: UUID().hashValue, productID: UUID().hashValue,
//             qty: 0, details: .init(colorID: UUID().hashValue, size: "XS"), type: 0,
//             createdAt: "", updatedAt: "", product: CartMockData.product),
//        Cart(id: UUID().hashValue, userID: UUID().hashValue, productID: UUID().hashValue,
//             qty: 0, details: .init(colorID: UUID().hashValue, size: "XX"), type: 0,
//             createdAt: "", updatedAt: "", product: CartMockData.product),
//        Cart(id: UUID().hashValue, userID: UUID().hashValue, productID: UUID().hashValue,
//             qty: 0, details: .init(colorID: UUID().hashValue, size: "L"), type: 0,
//             createdAt: "", updatedAt: "", product: CartMockData.product),
//        Cart(id: UUID().hashValue, userID: UUID().hashValue, productID: UUID().hashValue,
//             qty: 0, details: .init(colorID: UUID().hashValue, size: "N"), type: 0,
//             createdAt: "", updatedAt: "", product: CartMockData.product),
//        Cart(id: UUID().hashValue, userID: UUID().hashValue, productID: UUID().hashValue,
//             qty: 0, details: .init(colorID: UUID().hashValue, size: "M"), type: 0,
//             createdAt: "", updatedAt: "", product: CartMockData.product),
//    ]
    
    static let productViewMock: Product = .init(id: 0, imageURL: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRLFpHvcnLF_bSXXkh-qkvAZzQEKnDBaJv0LS1iYhWYupg3XNRtgV7MrxOlNfAphM1ikNVM0Bc4LPnmRKWBpfsc7zS-7-7S1TBifg_3VpA_&usqp=CAc", title: "T-shirt Basic", priceWithCurrency: "375 000 UZS", size: "L", color: "Blue", quantity: 4)
}

