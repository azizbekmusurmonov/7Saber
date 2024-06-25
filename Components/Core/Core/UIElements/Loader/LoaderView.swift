//
//  LoaderView.swift
//  Core
//
//  Created by Azizbek Musurmonov   on 19/06/24.
//

import AssetKit
import SwiftUI

public struct LoaderView: View {
    @State private var isAnimating = false

    public init() { }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(Asset.Color.Text.primaryCol.swiftUIColor, lineWidth: 5)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: ValueTransformer())
                    .onAppear {
                        self.isAnimating = true
                    }
            }
        }
        .frame(width: 50, height: 50)
    }
}
