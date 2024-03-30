//
//  CategoryAppApp.swift
//  CategoryApp
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import CategoryTarget

@main
struct CategoryAppApp: App {
    
    @StateObject var vm = CategoryViewModel()
    
    var body: some Scene {
        WindowGroup {
            CategoryTargetView()
                .environmentObject(vm)
        }
    }
}
