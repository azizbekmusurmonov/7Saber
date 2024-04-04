//
//  CartView.swift
//  Cart
//
//  Created by Ismatillokhon on 3/30/24.
//

import SwiftUI
import AssetKit

public struct CartView: View {
    
    @EnvironmentObject var vm: CartViewModel
    
    public init() { }
    
    public var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(uiImage: Asset.Image.pic.image)
                        .resizable()
                        
                        .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                    
                    Text("d.smclkdsdsc")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    CartView()
}
