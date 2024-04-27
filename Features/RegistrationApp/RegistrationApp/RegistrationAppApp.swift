//
//  RegistrationAppApp.swift
//  RegistrationApp
//
//  Created by Azizbek Musurmonov   on 02/04/24.
//

import SwiftUI
import Registration

@main
struct RegistrationAppApp: App {
    var body: some Scene {
        WindowGroup {
            RegisterMobillAppView(skipButtonTapped: { })
        }
    }
}
