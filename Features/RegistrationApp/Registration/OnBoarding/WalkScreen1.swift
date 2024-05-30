//
//  OnBordingView.swift
//  OnBording
//
//  Created by Turonboyev Ismatillokhon on 12/05/24.
//

import AssetKit
import SwiftUI

struct WalkScreen1:View {
    var body: some View {
        
        VStack {
            Text("Feel".uppercased())
                .font(.system(size: 119))
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.white)
            
            Text("The comfort".uppercased())
                .font(.system(size: 40))
                .frame(maxWidth: .infinity,alignment:.leading)
                .foregroundColor(.white)
            
            Text("ON")
                .font(.system(size: 69,weight: .regular))
                .frame(maxWidth: .infinity,alignment:.center)
                .foregroundColor(.white)
                .padding(.leading,120)
            
            Text("every".uppercased())
                .font(.system(size: 40,weight: .light))
                .frame(maxWidth: .infinity,alignment:.center)
                .foregroundColor(.white)
                .padding(.leading,120)
            
            Text("step".uppercased())
                .font(.system(size: 40,weight: .light))
                .frame(maxWidth: .infinity,alignment: .trailing)
                .foregroundColor(.white)
                .padding(.trailing,40)
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            Asset.Image.OnBoarding.image1.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all))
        
        
    }
}
