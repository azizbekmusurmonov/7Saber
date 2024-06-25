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
    
    @EnvironmentObject var vm: ProfileViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                if let url = URL(string: vm.profileData?.avatar.src ?? "") {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 146, height: 146)
                                .background(Color.gray)
                                .clipShape(Circle())
                                .padding()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 146, height: 146)
                                .clipShape(Circle())
                                .padding()
                        case .failure:
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 146, height: 146)
                                .clipShape(Circle())
                                .padding()
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 146, height: 146)
                        .clipShape(Circle())
                        .padding()
                }
                
                Divider()
                VStack(spacing: .zero) {
                    Spacer()
                    Text(vm.profileData?.fullName ?? "")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        .padding(2)
                    Text(vm.profileData?.email ?? "")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    
                        .padding(10)
                    Spacer()
                    Divider()
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("EDIT PROFILE")
                            .font(.system(size: 13, weight: .regular))
                        
                        Image(uiImage: Asset.Image.Icons.edit.image)
                        
                    }
                    .padding()
                    .frame(height: 40)
                    .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                    .clipShape(.capsule)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
