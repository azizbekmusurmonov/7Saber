//
//  ProfileTab.swift
//  Core
//
//  Created by Azizbek Musurmonov   on 10/04/24.
//

import SwiftUI
import AssetKit

public struct ProfileTab: View {
    
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
    
   public var body: some View {
       VStack(spacing: .zero) {
           HStack(spacing: .zero) {
               Text(title)
                   .font(.title2)
                   .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                   .padding()
               Spacer()
               
               Spacer()
               Image(uiImage: Asset.Image.Icons.chevronRight.image)
                   .resizable()
                   .frame(width: 5.59, height: 12)
                   .padding()
           }
       }
       .frame(height: 56)
       Divider()
    }
}

public struct ProfileTabHeader: View {
    
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        HStack(spacing: .zero) {
            Text(title)
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                .multilineTextAlignment(.leading)
                .font(.headline)
                .font(.system(size: 23))
                .padding()
                .padding(.top, 30)
            Spacer()
        }
    }
}
