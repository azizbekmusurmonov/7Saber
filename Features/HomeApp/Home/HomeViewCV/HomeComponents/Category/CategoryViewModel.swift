//
//  CategoryViewModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import SwiftUI


class CategoryController: ObservableObject {
    @Published var categories: [Category] = []
    
    func fetchCategories() {
    
        let imageURLs = [
            "https://images.uzum.uz/coaemo283ve66on3qop0/original.jpg",
            "https://images.uzum.uz/cequsbgv1htd23akac7g/original.jpg",
            "https://images.uzum.uz/ci6mfet40v9pplt421ng/original.jpg",
            "https://images.uzum.uz/cj1p2kv5d7kom1tkqt80/original.jpg"
        ]
        
        let productInfo = [
            ("MAN", ""),
            ("WOMAN", ""),
            ("KIDS", ""),
            ("ACCESSORIES", ""),
        ]
        
        for index in 0..<imageURLs.count {
            let category = Category(name: productInfo[index].0,
                                    imageURL: URL(string: imageURLs[index])!,
                                    price: productInfo[index].1)
            categories.append(category)
        }
    }
}
