//
//  CurrentOrdersView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import AssetKit
import Core

struct CurrentOrdersView: View {
    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

extension CurrentOrdersView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "MY ORDERS ",
                              leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    CurrentOrdersView()
}
