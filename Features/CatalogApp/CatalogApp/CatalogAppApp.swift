//
//  CatalogAppApp.swift
//  CatalogApp
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Catalog

@main
struct CatalogAppApp: App {
    
    @StateObject var vm = CatalogViewModel()
    
    var body: some Scene {
        WindowGroup {
            CatalogView()
                .environmentObject(vm)
        }
    }
}
