//
//  FonImage.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 02/05/24.
//

import SwiftUI
import Core
import AssetKit

struct FonImage: View {
    
    @State var image: UIImage? = nil
    @State var showImagePicker: Bool = false
    
    @EnvironmentObject var vm: PersonalInfoViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                Image(uiImage: vm.profileImage ?? Asset.Image.Logo.person.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 146, height: 146)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .fill(Color.black.opacity(0.5))
                    }
                    .overlay(
                        Button(action: {
                            showImagePicker.toggle()
                        }) {
                            Image(uiImage: Asset.Image.Icons.plusCrcleWhite.image)
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                    )
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(sourceType: .photoLibrary, maxFileSize: 1 * 1024 * 1024) { image in
                            self.vm.profileImage = image
                        }
                    }
                Spacer()
            }
        }
    }
}
