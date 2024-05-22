//
//  BigText.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct BigText: View {
    @State private var animated = false // State variable to control animations
    
    var body: some View {
        Text("THERE ARE THREE TYPES OF PEOPLE IN SPORTS AND BUSINESS. THOSE WHO MAKE IT POSSIBLE, THOSE WHO WATCH IT HAPPEN, AND THOSE WHO WONDER WHAT HAPPENED.")
            .font(.system(size: 40))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding()
            .scaleEffect(animated ? 1 : 1) // Scale effect for animation
            .rotationEffect(Angle(degrees: animated ? 0 : 0)) // Rotation effect for animation
            .opacity(animated ? 1 : 1) // Opacity effect for animation
            .offset(x: animated ? 0 : 0, y: animated ? 0 : 0) // Offset for movement effect
            .foregroundColor(animated ? .white : .black) // Color change effect
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                    self.animated.toggle() // Toggle animation state on view appear
                }
            }
    }
}

