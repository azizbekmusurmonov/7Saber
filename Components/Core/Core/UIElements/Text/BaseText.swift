//
//  BaseText.swift
//  Core
//
//  Created by Ismatillokhon on 5/6/24.
//

import SwiftUI
import AssetKit

public struct BaseText: View {
    
    public let title: String
    public let font: Font
    public let textColor: Color
    public let textAlignment: TextAlignment
    public let lineLimit: Int
    public let insets: EdgeInsets
    
    public init(
        _ title: String,
        _ font: Font,
        _ textColor: Color = Asset.Color.Text.primaryCol.swiftUIColor,
        _ textAlignment: TextAlignment = .leading,
        _ lineLimit: Int = 1,
        insets: EdgeInsets = .init(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
    ) {
        self.title = title
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.lineLimit = lineLimit
        self.insets = insets
    }
    
    public var body: some View {
        Text(title)
            .font(font)
            .multilineTextAlignment(textAlignment)
            .foregroundColor(textColor)
            .lineLimit(lineLimit)
            .padding(insets)
    }
}

