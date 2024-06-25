//
//  SegmentAll.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import SwiftUI

struct SegmentedController2: View {
    @State private var selectedSegmentIndex = 0
    
    let segments = ["All", "Tops", "T-Shirt", "Long sleeve shirts", "Sweaters", "Jackets", "Hoodie", "Suits"]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            SegmentedControlHeader2(segments: segments, selectedSegmentIndex: $selectedSegmentIndex)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: 15)
    }
}

struct SegmentedControlHeader2: View {
    let segments: [String]
    @Binding var selectedSegmentIndex: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(segments.enumerated()), id: \.offset) { index, segment in
                    SegmentedControlItem2(title: segment, isSelected: selectedSegmentIndex == index)
                        .onTapGesture {
                            withAnimation {
                                selectedSegmentIndex = index
                            }
                        }
                }
            }
        }
        .frame(height: 40)
        .padding(.vertical, 8)
        SegmentedControlIndicator2(segments: segments, selectedSegmentIndex: $selectedSegmentIndex)
            .padding(.top, -40)
    }
}

struct SegmentedControlItem2: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 10))
            .foregroundColor(isSelected ? .black : .gray)
            .padding(.horizontal, 16) // Adjust padding here
            .padding(.vertical, 6) // Adjust padding here
            .background(isSelected ? Color.white : Color.clear)
    }
}

struct SegmentedControlIndicator2: View {
    let segments: [String]
    @Binding var selectedSegmentIndex: Int
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.black)
                .frame(width: geometry.size.width / CGFloat(segments.count), height: 3)
                .offset(x: CGFloat(selectedSegmentIndex) * geometry.size.width / CGFloat(segments.count))
                .animation(.easeInOut, value: ValueTransformer())
        }
    }
}
