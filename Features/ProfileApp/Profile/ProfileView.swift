//
//  ProfileViewModel.swift
//  Profile
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI

public struct ProfileView: View {
    
    @EnvironmentObject var vm: ProfileViewModel
    
    public init() { }
    public var body: some View {
        Text("Hello, World!, count \(vm.count)")
    }
}

#Preview {
    ProfileView()
}
