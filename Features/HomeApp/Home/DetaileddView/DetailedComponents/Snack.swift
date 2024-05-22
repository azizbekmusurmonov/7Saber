//
//  Snack.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct SnackBarView: View {
    var message: String
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
         
            Text(message)
                .padding()
                .background(Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(8)
                .frame(width: UIScreen.main.bounds.width)
                .animation(.easeInOut(duration: 0.5))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
                .padding()
            Spacer()
        } .frame(width: UIScreen.main.bounds.width)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView22: View {
    @State private var isShowingSnackBar = false
    
    var body: some View {
        VStack {
          
            Button("Send Code") {
                isShowingSnackBar = true
            }
            .padding()
            
            if isShowingSnackBar {
                SnackBarView(message: "Your new Code", isShowing: $isShowingSnackBar)
                    .transition(.move(edge: .top))
            }
            Spacer()
            
        }
        .padding()
    }
}

struct ContentView_Previews22: PreviewProvider {
    static var previews: some View {
        ContentView22()
    }
}
