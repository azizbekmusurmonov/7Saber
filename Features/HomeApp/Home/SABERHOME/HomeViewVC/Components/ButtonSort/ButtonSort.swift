//
//  ButtonSort.swift
//  SABERHOME
//
//  Created by islombek on 30/03/24.
//

import SwiftUI



struct ButtonSort: View {
    var body: some View {
        VStack {
            Text("BUY SPORTS")
                .font(.system(size: 19))
                .fontWeight(.semibold)
                .padding(.top, 90)
            
            Spacer()
            
            Button("RUNNING") {
                
            }
            .padding(.top, 15)
            .buttonStyle(MyButtonStyle())
            
            Button("TRIATHLON") {
                // Action for Jumping button
            }
            .buttonStyle(MyButtonStyle())
            
            
            Button("SWIMMING") {
                // Action for Boxing button
            }
            .buttonStyle(MyButtonStyle())
            
            
            Button("BOXING") {
                // Action for Boxing button
            }
            .buttonStyle(MyButtonStyle())
            
            Button("JUDO") {
                // Action for Boxing button
            }
            .buttonStyle(MyButtonStyle())
            
            Button("OTHER") {
                // Action for Other button
            }
            .buttonStyle(MyButtonStyle())
            
            Spacer()
        }
        .padding()
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 28))
          
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(80)
            .frame(width: 350, height: 70)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.vertical, 1)
            .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
    }
}





