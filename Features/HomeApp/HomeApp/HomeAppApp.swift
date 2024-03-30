//
//  HomeAppApp.swift
//  HomeApp
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Home

@main
struct HomeAppApp: App {
    
    @StateObject var homeVm = HomeViiewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(homeVm)
        }
    }
}
