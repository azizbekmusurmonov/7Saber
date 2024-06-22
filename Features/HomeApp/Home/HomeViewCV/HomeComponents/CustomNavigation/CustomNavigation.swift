//
//  CustomNavigation.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct CustomNavigation: ViewModifier {
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            VStack {
                Divider()
                
                HStack {
                    Image("SaberNav")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(12)
                    
                    Divider()
                    
                    Spacer()
                    
                    Image("personCircle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(10)
                    
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Image("savat")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(10)
                    }
                    .padding(7)
                    
                    Divider()
                    
                    Button(action: {
                        print("Menu button tapped")
                    }) {
                        Image("3line")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(10)
                    }
                }
                Divider()
                

          
            }
           
            
            
            
            content
        }.background(Blur(style: .light))
            .padding(.top)
            .frame(height: 60)
    }
}

extension View {
    func customNavigation() -> some View {
        self.modifier(CustomNavigation())
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        return visualEffectView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct CustomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .customNavigation()
    }
}

