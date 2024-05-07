//
//  DynamicBottomSheet.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 06/05/24.
//

import SwiftUI

public struct HeightPreferenceKey: PreferenceKey {
    public static var defaultValue: CGFloat?

    public static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

public struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    public func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

public extension View {
    func readHeight() -> some View {
        self
            .modifier(ReadHeightModifier())
    }
}
