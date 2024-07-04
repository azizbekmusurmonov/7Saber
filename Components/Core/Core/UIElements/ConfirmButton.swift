//
//  ConfirmButton.swift
//  Core
//
//  Created by Ismatillokhon on 03/07/24.
//

import SwiftUI
import AssetKit

public struct ConfirmButton: View {
        
    @Binding public var isEnable: Bool
    public let title: String
    public let icon: Image
    public let action: () -> Void
    
    public init(title: String, icon: Image, isEnable: Binding<Bool>, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self._isEnable = isEnable
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                HStack {
                    Text(title)
                        .foregroundColor(
                            isEnable
                            ? Asset.Color.Text.whiteCol.swiftUIColor
                            : Asset.Color.Button.grayCol.swiftUIColor
                        )
                        .padding(16)
                    Spacer()
                    icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(
                            isEnable
                            ? Asset.Color.Text.whiteCol.swiftUIColor
                            : Asset.Color.Button.grayCol.swiftUIColor
                        )
                        .frame(width: 22.dpWidth(), height: 22.dpHeight())
                        .padding(.trailing, 16)
                }
                .background(
                    isEnable
                    ? Asset.Color.Button.blackCol.swiftUIColor
                    : .init(hex: "#9E9E9E")
                )
                .clipShape(.capsule)
                .padding(.init(
                    top: 16.dpHeight(),
                    leading: 24.dpWidth(),
                    bottom: 16.dpHeight(),
                    trailing: 24.dpWidth())
                )
            }.background(Color.white)
        }
    }
}
