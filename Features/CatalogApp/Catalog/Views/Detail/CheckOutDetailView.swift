//
//  CheckOutDetailView.swift
//  Catalog
//
//  Created by Ismatillokhon on 5/6/24.
//

import SwiftUI
import Core

public struct CheckOutDetailView: View {
    
    @EnvironmentObject public var vm: CheckOutDetailVM
    
    
    public var body: some View {
        VStack {
            BottomSheetsNavBar(title: "CHECKOUT")
            
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
}

#Preview {
    CheckOutDetailView()
}
