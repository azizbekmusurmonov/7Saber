//
//  NavigationBar.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 20/04/24.
//

import SwiftUI
import AssetKit

struct NavigationBar: View {
    
    var showButton: Bool
    @StateObject var vm = RegisterMobillAppViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                if showButton {
                    Button(action: {
                        print("left button Tapped")
                    }, label: {
                        Image(uiImage: Asset.Image.Icons.arrowLeft.image)
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                    .frame(width: 40, height: 40)
                }
                Spacer()
                Button(action: {
                    print("SKIP button Tapped")
                    
                    withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                        self.vm.isCodeViewPresented = false
                    }
                }, label: {
                    Text("SKIP")
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                })
                .frame(height: 40)
            }
            .padding(.leading, 36)
            .padding(.trailing, 36)
            .padding(.top, 20)
        }
        Spacer()
    }
}

#Preview {
    NavigationBar(showButton: true)
}
