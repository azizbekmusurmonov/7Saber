//
//  AddressView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import Core
import AssetKit

struct AddressView: View {
    
    @State var items: [Item] = [
        Item(title: "MY OFFICE",
             location: "Mukimiy st. 59, Tashkent, Uzbekistan",
             seeOnMap: "SEE ON MAP"
            ),
        Item(title: "MY OFFICE",
             location: "Mukimiy st. 59, Tashkent, Uzbekistan",
             seeOnMap: "SEE ON MAP"
            )
    ]
    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        
        VStack(spacing: .zero) {
            
            navBar
            Spacer()
            
            if items.isEmpty {
                AddressesIsEmpty()
                Spacer()
            } else {
                
            ScrollView {
                VStack(spacing: .zero) {
                    
                        ForEach(items, id: \.self) { item in
                            AddressItemView(item: item)
                            Divider()
                        }
                        .padding()
                    }
                }
            }
            AddButton(title: "ADD NEW ADDRESS", buttonPressed:{
                print("button pressed")
            } )
        }
        .navigationBarBackButtonHidden()
    }
}

extension AddressView {
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "ADDRESSES ", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
    }
}

#Preview {
    AddressView()
}
