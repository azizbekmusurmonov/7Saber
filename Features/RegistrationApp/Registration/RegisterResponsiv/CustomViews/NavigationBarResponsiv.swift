//
//  NavigationBar.swift
//  RegistrationApp
//
//  Created by Asadbek Yoldoshev on 14/04/24.
//

import SwiftUI
import AssetKit

extension View {
    func customNavigationBar() -> some View {
        VStack(spacing: 0) {
            Divider()
            HStack(spacing: 0) {
                Image(uiImage: Asset.Image.Logo.logoBlack.image)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .padding(.horizontal, 12)
                Divider()
                Spacer()
            }
            Divider()
        }
    }
}
