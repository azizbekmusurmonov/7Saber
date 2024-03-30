//
//  ProfileAppApp.swift
//  ProfileApp
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Profile

@main
struct ProfileAppApp: App {
    
    @StateObject var vm = ProfileViewModel()
    
    var body: some Scene {
        WindowGroup {
            ProfileView().environmentObject(vm)
        }
    }
}
