//
//  WelcomeView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import AssetKit

struct WelcomeView: View {
    
    let welcome: String
    let welcomeText: String
    
    init(welcome: String = "WELCOME", welcomeText: String) { // Initialize the parameter
        self.welcomeText = welcomeText
        self.welcome = welcome
    }
    
    var body: some View {
        
            HStack() {
                VStack(alignment: .leading) {
                    Image(uiImage: Asset.Image.Logo.logoBlack.image)
                        .resizable()
                        .frame(width: 36, height: 36)
                    Text(welcome)
                        .font(.system(size: 40))
                        .padding(.top, 20)
                        .padding(.bottom, 12)
                    Text(welcomeText)
                        .font(.system(size: 16))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
                .padding(.leading, 40)
                Spacer()
            }
//            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

#Preview {
    WelcomeView(welcome: "", welcomeText: "")
}
