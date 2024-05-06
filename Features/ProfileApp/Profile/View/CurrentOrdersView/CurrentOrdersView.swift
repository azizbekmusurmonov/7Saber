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
        VStack(spacing: .zero) {
            navBar
            Spacer()
            ScrollView {
                VStack(spacing: .zero) {
                    
                }
            }
        }
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
