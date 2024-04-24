//
//  WelcomeView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import AssetKit

struct WelcomeView: View {
    
    let welcomeText: String
    
    init(welcomeText: String) { // Initialize the parameter
        self.welcomeText = welcomeText
    }
    
    var body: some View {
        ZStack {
            HStack() {
                VStack(alignment: .leading) {
                    Image(uiImage: Asset.Image.Logo.logoBlack.image)
                        .resizable()
                        .frame(width: 36, height: 36)
                    Text("WELCOME")
                        .font(.system(size: 40))
                        .padding(.top, 20)
                        .padding(.bottom, 12)
                    Text(welcomeText)
                        .font(.system(size: 16))
                    Spacer()
                }
                .padding(.leading, 40)
                Spacer()
            }
        }
    }
}

#Preview {
    WelcomeView(welcomeText: "")
}
