//
//  CatalogView.swift
//  Catalog
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import Core

public struct CatalogView: View {
    
    @StateObject var checkOutDetailVM = CheckOutDetailVM()
    
    @EnvironmentObject var vm: CatalogViewModel
    
    @State var detentHeight: CGFloat = .zero
    @State var presentSheet: Bool = false
    
    public init() { }
    
    public var body: some View {
        VStack {
            Spacer()
            Button(action: {
                presentSheet = true
            }) {
                Text("open CHECKOUT")
                    .font(.largeTitle)
            }
            
            Spacer()
        }
        
        .sheet(isPresented: self.$presentSheet) {
            if #available(iOS 16.0, *) {
                CheckOutDetailView()
                    .environmentObject(checkOutDetailVM)
                    .readHeight()
                    .onPreferenceChange(HeightPreferenceKey.self) { height in
                        if let height {
                            self.detentHeight = height
                        }
                    }
                    .presentationDetents([.height(self.detentHeight)])
            } else {
                CheckOutDetailView()
                    .environmentObject(checkOutDetailVM)
            }
        }
        
    }
}

#Preview {
    CatalogView()
}
