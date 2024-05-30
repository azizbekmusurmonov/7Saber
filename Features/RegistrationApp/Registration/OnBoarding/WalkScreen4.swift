//
//  WalkScreen4.swift
//  OnBording
//
//  Created by Turonboyev Ismatillokhon on 12/05/24.
//

import SwiftUI
import AssetKit

struct WalkScreen4:View {
    var body: some View {
        VStack {
            Text("never".uppercased())
                .font(.system(size: 40))
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.white)
                .padding(.leading,40)
            
            Text("put an".uppercased())
                .font(.system(size: 28))
                .frame(maxWidth: .infinity,alignment:.center)
                .foregroundColor(.white)
            
            Text("age limit".uppercased())
                .font(.system(size: 69))
                .frame(maxWidth: .infinity,alignment:.trailing)
                .foregroundColor(.white)
                .padding(.trailing,40)
            
            Text("on your".uppercased())
                .font(.system(size: 40,weight: .light))
                .frame(maxWidth: .infinity,alignment:.trailing)
                .foregroundColor(.white)
                .padding(.trailing,40)
            
            Text("dreams".uppercased())
                .font(.system(size: 95,weight: .light))
                .frame(maxWidth: .infinity,alignment: .center)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            Asset.Image.OnBoarding.image4.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    WalkScreen4()
}
