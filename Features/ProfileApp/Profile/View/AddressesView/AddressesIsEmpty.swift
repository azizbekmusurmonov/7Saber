//
//  AddressesIsEmpty.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI
import AssetKit
import Core

struct AddressesIsEmpty: View {
    var body: some View {
        VStack(spacing: .zero) {
            VStack(alignment: .leading) {
                
                navBar
                
                Image(uiImage: Asset.Image.Icons.globe.image)
                    .resizable()
                    .frame(width: 26.67, height: 26.67)
                    .padding(.leading)
                Text("YOU DON’T HAVE ADDRESS")
                    .font(.footnote)
                    .padding(.leading)
                    .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                Text("Seems you have not added your address yet")
                    .font(.footnote)
                    .padding(.leading)
                    .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
            }

            
            addNewAddressButton
            
        }
    }
}

extension AddressesIsEmpty {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "ADDRESSES ", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed:  {
                print("leftButtonPressed")
            })
            Spacer()
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
    AddressesIsEmpty()
}
