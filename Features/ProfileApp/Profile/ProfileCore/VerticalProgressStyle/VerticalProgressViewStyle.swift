//
//  VerticalProgressViewStyle.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 02/06/24.
//
import SwiftUI

public struct VerticalProgressViewStyle: ProgressViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                
                Capsule()
                    .frame(width: 5, height: CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.height)
                    .foregroundColor(.blue)
                Capsule()
                    .frame(width: 5, height: geometry.size.height)
                    .foregroundColor(Color.gray.opacity(0.5))
            }
        }
    }
}
