//
//  ProfileImageView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 02/05/24.
//

import SwiftUI
import AssetKit
import Core

struct ProfileImageView: View {
    
    @Binding var bundle: ProfileBundle
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                Image(uiImage: bundle.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 146, height: 146)
                    .clipShape(Circle())
                    .padding()
                
                Divider()
                Spacer()
                
                VStack(spacing: .zero) {
                    Text(bundle.profileName)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        .padding(2)
                    Text(bundle.gmailName)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    
                        .padding(10)
                    Divider()
                    
                    Button(action: {
                        
                    }) {
                        Text("EDIT PROFILE")
                            .font(.system(size: 13, weight: .regular))
                            .padding()
                            .font(.footnote)
                        
                        Image(uiImage: Asset.Image.Icons.edit.image)
                        
                    }
                    .frame(height: 40)
                    .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                    .clipShape(.capsule)
                    .padding()
                }
            }
            
        }
    }
}
