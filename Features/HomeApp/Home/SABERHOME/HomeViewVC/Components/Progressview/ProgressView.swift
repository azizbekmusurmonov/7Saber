//
//  ProgressView.swift
//  SABERHOME
//
//  Created by islombek on 31/03/24.
//
import SwiftUI

struct AnimatedCircleProgressView: View {
    @State private var progress: CGFloat = 0.0
    
    let animationDuration: Double = 2.0 // Adjust as needed
    let lineWidth: CGFloat = 7.0
    let circleColor: Color = Color.gray
    let trackColor: Color = Color.gray.opacity(0.3)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(trackColor, lineWidth: lineWidth)
                .frame(width: 70, height: 70)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(circleColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(-10))
                .animation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false))
        }
        .onAppear {
            withAnimation {
                self.progress = 1 // Set the progress value you want to animate to
            }
        }
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            AnimatedCircleProgressView()
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
