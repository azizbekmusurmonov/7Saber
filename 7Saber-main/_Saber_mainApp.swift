//
//  _Saber_mainApp.swift
//  7Saber-main
//
//  Created by Ismatillokhon on 3/26/24.
//

import SwiftUI
import Core
import Registration

@main
struct _Saber_mainApp: App {
    
    @StateObject var registerVM = RegisterMobillAppViewModel()
    @State var skipButtonPressed: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if (DataStorage.storage.get(from: .isRegistrate) as? Bool) == true || skipButtonPressed  {
                TabBarView()
                    .preferredColorScheme(.light)
                    .environmentObject(registerVM)
            } else {
                RegisterMobillAppView(skipButtonTapped: {
                    skipButtonPressed = true
                    print("tapped")
                }, hasSkipButton: true)
                    .environmentObject(registerVM)
                    .preferredColorScheme(.light)
            }
        }
    }
}
