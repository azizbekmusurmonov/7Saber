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
    var body: some View {
        VStack(spacing: .zero) {
           
            navBar
            
            ScrollView {
                VStack(alignment: .leading, spacing: .zero) {
                    
                }
            }
        }
    }
}

extension AddressView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "ADDRESSES ", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed:  {
                print("leftButtonPressed")
            })
            Spacer()
        }
    }
    
}

#Preview {
    AddressView()
}
