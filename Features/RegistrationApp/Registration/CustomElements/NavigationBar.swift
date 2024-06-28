//
//  NavigationBar.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 20/04/24.
//

import SwiftUI
import AssetKit

struct NavigationBar: View {
    
    var showButton: Bool
    var leftButtonAction: () -> Void
    var skipButtonAction: () -> Void
    let hasSkipButton: Bool
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    init(showButton: Bool, leftButtonAction: @escaping () -> Void, skipButtonAction: @escaping () -> Void, hasSkipButton: Bool = true) {
        self.showButton = showButton
        self.leftButtonAction = leftButtonAction
        self.skipButtonAction = skipButtonAction
        self.hasSkipButton = hasSkipButton
    }
    
    var body: some View {
        ZStack {
            HStack {
                if showButton {
                    Button(action: {

                        leftButtonAction()
                    }, label: {
                        Image(uiImage: Asset.Image.Icons.arrowLeft.image)
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                    .frame(width: 40, height: 40)
                }
                Spacer()
                if hasSkipButton {
                    Button(action: {
                        
                        skipButtonAction()
                    }, label: {
                        Text("SKIP")
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    })
                    .frame(height: 40)
                }
            }
            .padding(.leading, 36)
            .padding(.trailing, 36)
            .padding(.top, 20)
        }
        Spacer()
    }
}

#Preview {
    NavigationBar(showButton: true, leftButtonAction: { }, skipButtonAction:  { })
}
