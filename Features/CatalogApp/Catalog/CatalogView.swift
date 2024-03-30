//
//  CatalogView.swift
//  Catalog
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI

public struct CatalogView: View {
    
    @EnvironmentObject var vm: CatalogViewModel
    
    public init() { }
    
    public var body: some View {
        Text("Hello, CatalogView")
    }
}

#Preview {
    CatalogView()
}
