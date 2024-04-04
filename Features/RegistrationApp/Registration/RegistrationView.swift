//
//  RegistrationView.swift
//  Registration
//
//  Created by Azizbek Musurmonov   on 02/04/24.
//

import SwiftUI
import AssetKit

public struct RegistrationView: View {
    public init() { }
    public var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(uiImage: Asset.Image.pic.image)
                        .resizable()
                        
                        .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                    
                    Text("d.smclkdsdsc")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
