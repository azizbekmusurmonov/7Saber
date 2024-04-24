//
//  Segment.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//
import SwiftUI

struct SegmentedController: View {
    @State private var selectedSegmentIndex = 0
    
    let segments = ["MEN", "WOMAN", "KIDS", "ACCESSORIES"]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            SegmentedControlHeader(segments: segments, selectedSegmentIndex: $selectedSegmentIndex)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

struct SegmentedControlHeader: View {
    let segments: [String]
    @Binding var selectedSegmentIndex: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<segments.count) { index in
                SegmentedControlItem(title: segments[index], isSelected: selectedSegmentIndex == index)
                    .background(index != segments.count - 1 ? Color.white : Color.clear)
                    .onTapGesture {
                        withAnimation {
                            selectedSegmentIndex = index
                        }
                    }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
        .padding(.vertical, 8)
        SegmentedControlIndicator(segments: segments, selectedSegmentIndex: $selectedSegmentIndex)
            .padding(.top, -40)
    }
}



struct SegmentedControlItem: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 10))
            .foregroundColor(.black)
            .padding(.horizontal, 0) // Add horizontal padding here
            .padding(.vertical, 6) // Add vertical padding here
            .frame(maxWidth: .infinity)
    }
}



struct SegmentedControlIndicator: View {
    let segments: [String]
    @Binding var selectedSegmentIndex: Int
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.black)
                .frame(width: geometry.size.width / CGFloat(segments.count), height: 3)
                .offset(x: CGFloat(selectedSegmentIndex) * geometry.size.width / CGFloat(segments.count))
                .animation(.easeInOut)
        }
    }
}




struct SegmentedController_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedController()
    }
}
