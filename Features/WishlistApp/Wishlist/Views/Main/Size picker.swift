//
//  Size picker.swift
//  Wishlist
//
//  Created by admin on 5/9/24.
//

import SwiftUI

import SwiftUI

struct SizePickerView: View {
    let sizes = ["2XS", "XS", "S", "M", "L", "XL", "2XL", "3XL"]
    @State private var selectedSize: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(sizes.prefix(8), id: \.self) { size in
                    SizeButton(size: size, isSelected: size == selectedSize) {
                        selectedSize = size
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 60)
        }
        .padding()
      //  .background(Color.white)
        .cornerRadius(40)
        .frame(height: 60)
    }
}

struct SizeButton: View {
    let size: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(size)
                .font(.system(size: 18))
                .foregroundColor(isSelected ? .white : .gray) // Set text color to gray
                .frame(width: 60, height: 48)
                .background(isSelected ? Color.gray : Color.white)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.gray, lineWidth: 1)
                )
                .scaleEffect(isSelected ? 1.1 : 1.0)
        }
    }
}
