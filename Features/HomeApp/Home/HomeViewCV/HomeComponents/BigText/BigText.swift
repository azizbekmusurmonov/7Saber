//
//  BigText.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct BigText: View {
    @State private var animated = false
    
    var body: some View {
        Text("THERE ARE THREE TYPES OF PEOPLE IN SPORTS AND BUSINESS. THOSE WHO MAKE IT POSSIBLE, THOSE WHO WATCH IT HAPPEN, AND THOSE WHO WONDER WHAT HAPPENED.")
                  .font(.system(size: 40))
                  .fontWeight(.bold)
                  .multilineTextAlignment(.center)
                  .padding()
                  .scaleEffect(animated ? 0.9 : 1)
        .opacity(animated ? 1 : 0.8)
        .foregroundColor(animated ? .white : .black)
        .animation(
            Animation.easeInOut(duration: 5)
                .repeatForever(autoreverses: true),
            value: animated
        )
        .onAppear {
            self.animated.toggle()
        }
    }
}


