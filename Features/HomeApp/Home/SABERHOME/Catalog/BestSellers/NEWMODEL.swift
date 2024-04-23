//
//  NEWMODEL.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//

//import SwiftUI
//
//struct Product2 {
//    let name: String
//    let price: String
//    let imageURL: URL
//}
//
//
//import Foundation
//
//class NewCollectionController2: ObservableObject {
//    @Published var products2: [Product] = []
//    
//    func fetchProducts() {
//        // Simulated data fetching
//        let imageURLs = [
//            "https://cdn.dsmcdn.com/ty579/product/media/images/20221025/16/202177913/606856444/1/1_org_zoom.jpg",
//            "https://cdn.dsmcdn.com/ty703/product/media/images/20230126/17/266643335/841227579/1/1_org_zoom.jpg",
//            "https://cdn.dsmcdn.com/ty1146/product/media/images/prod/SPM/PIM/20240125/14/2f455ab7-55e1-3c40-af02-c39ecbde6687/1_org_zoom.jpg",
//            "https://cdn.dsmcdn.com/ty818/product/media/images/20230408/8/320468833/905950790/1/1_org_zoom.jpg",
//            "https://cdn.dsmcdn.com/ty817/product/media/images/20230408/8/320468922/905951165/1/1_org_zoom.jpg",
//            "https://cdn.dsmcdn.com/ty720/product/media/images/20230207/8/276814386/852388672/1/1_org_zoom.jpg"
//        ]
//        
//        let productInfo = [
//            ("7BASIC 22 T-shirt", "150 000 UZS"),
//            ("7BASIC 22 Dress", "350 000 UZS"),
//            ("7BASIC 22 Hoodie", "199 000 UZS"),
//            ("7BASIC 22 Bag", "250 000 UZS"),
//            ("7BASIC 22 Hoodie", "199 000 UZS"),
//            ("7BASIC 22 Bag", "250 000 UZS")
//        ]
//        
//        for index in 0..<imageURLs.count {
//            let product = Product(name: productInfo[index].0,
//                                  price: productInfo[index].1,
//                                  imageURL: URL(string: imageURLs[index])!)
//            products2.append(product)
//        }
//    }
//}
