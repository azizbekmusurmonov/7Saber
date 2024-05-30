//
//  WalkScreen2.swift
//  OnBording
//
//  Created by Turonboyev Ismatillokhon on 12/05/24.
//

import SwiftUI
import AssetKit

struct WalkScreen2:View {
    
    
    var body: some View {
        VStack {
                Text("Tough times".uppercased())
                .font(.system(size: 40,weight: .light))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.white)
                
                Text("don't last".uppercased())
                    .font(.system(size: 60))
                    .frame(maxWidth: .infinity,alignment:.center)
                    .foregroundColor(.white)
                
                Text("But")
                .font(.system(size: 57))
                    .frame(maxWidth: .infinity,alignment:.center)
                    .foregroundColor(.white)
                    .padding(.leading,-30)
            
            Text("tough people".uppercased())
                .font(.system(size: 40,weight: .light))
                .frame(maxWidth: .infinity,alignment:.center)
                .foregroundColor(.white)
                .padding(.leading,-30)
               
            
            Text("do".uppercased())
                .font(.system(size: 119,weight: .light))
                .frame(maxWidth: .infinity,alignment: .trailing)
                .foregroundColor(.white)
                .padding(.trailing,40)
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            Asset.Image.OnBoarding.image2.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}


#Preview {
    WalkScreen2()
}
