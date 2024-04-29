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
            BaseNavigationBar(title: "ADDRESSES ", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed:  {
                print("leftButtonPressed")
            })
            Spacer()
            
            ScrollView {
                VStack(alignment: .leading, spacing: .zero) {
                    
                }
            }
        }
    }
}

#Preview {
    AddressView()
}
