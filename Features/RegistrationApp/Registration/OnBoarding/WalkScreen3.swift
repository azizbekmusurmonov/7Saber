//
//  WalkScreen3.swift
//  OnBording
//
//  Created by Turonboyev Ismatillokhon on 12/05/24.
//

import SwiftUI
import AssetKit

struct WalkScreen3:View {
    var body: some View {
        VStack {
            Text("don't".uppercased())
                .font(.system(size: 69))
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.white)
                .padding(.leading, 30)
            
            Text("count the days".uppercased())
                .font(.system(size: 33))
                .frame(maxWidth: .infinity,alignment:.center)
                .foregroundColor(.white)
                .padding(.leading,40)
            
            Text("but".uppercased())
                .font(.system(size: 40,weight: .regular))
                .frame(maxWidth: .infinity,alignment:.center)
                .foregroundColor(.white)
                .padding(.leading)
            
            Text("the days".uppercased())
                .font(.system(size: 57,weight: .light))
                .frame(maxWidth: .infinity,alignment:.trailing)
                .foregroundColor(.white)
                .padding(.leading,120)
            
            Text("count".uppercased())
                .font(.system(size: 83,weight: .light))
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.white)
                .padding(.leading,40)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            Asset.Image.OnBoarding.image3.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}


#Preview {
    WalkScreen3()
}
