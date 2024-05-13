//
//  ImagecolorView.swift
//  Core
//
//  Created by admin on 5/9/24.
//


import SwiftUI
import AssetKit

public struct ImageColorView: View {
    
    public let colors: [Color]
    @Binding public var colorIndex: Int
    
    public init(colors: [Color], colorIndex: Binding<Int>) {
        self.colors = colors
        self._colorIndex = colorIndex
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Text("Color")
                .font(.system(size: 16, weight: .semibold))
                .padding(.vertical, 9)
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(colors.indices, id: \.self) { index in
                        VStack(spacing: 6) {
                            ZStack {
                                Circle()
                                    .fill(colors[index])
                                    .frame(width: 48, height: 48)
                                    .onTapGesture {
                                        colorIndex = index
                                    }
                                if index == colorIndex {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.black)
                                        .background(Color.white)
                                        .clipShape(.circle)
                                }
                            }
                            Text(colors[index].description)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
