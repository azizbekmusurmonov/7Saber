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
//        Item(title: "MY OFFICE",
//             location: "Mukimiy st. 59, Tashkent, Uzbekistan",
//             seeOnMap: "SEE ON MAP"
//            ),
//        Item(title: "MY OFFICE",
//             location: "Mukimiy st. 59, Tashkent, Uzbekistan",
//             seeOnMap: "SEE ON MAP"
//            )
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
            addNewAddressButton
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
    
    var addNewAddressButton: some View {
        VStack(spacing: .zero) {
            Button(action: {
                
            }) {
                HStack(spacing: .zero) {
                    Text("ADD NEW ADDRESS")
                        .font(.footnote)
                        .foregroundColor(Asset.Color.Text.whiteCol.swiftUIColor)
                    Spacer()
                    Image(uiImage: Asset.Image.Icons.plusCrcleWhite.image)
                        .resizable()
                        .frame(width: 18.33, height: 18.33)
                }
            }
            .padding()
            .frame(width: 361,height: 56)
            .background(Asset.Color.Button.blackCol.swiftUIColor)
            .cornerRadius(26)
        }
        .padding()
    }
}

#Preview {
    AddressView()
}
