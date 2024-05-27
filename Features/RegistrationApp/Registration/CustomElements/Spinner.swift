//
//  Spinner.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 27/05/24.
//

import SwiftUI

struct iOSSpinner: View {
    @State private var isAnimating = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(Color.blue, lineWidth: 5)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear {
                        self.isAnimating = true
                    }
            }
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    iOSSpinner()
}
