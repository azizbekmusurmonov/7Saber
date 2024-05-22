//
//  ColorPicer.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import SwiftUI

struct ColorPickView: View {
    let colors: [Color] = [.green, .white, .black, .gray, .blue, .pink, .black]
    @Binding var selectedColor: Color?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(colors.indices, id: \.self) { index in
                    ColorCircle(color: colors[index], isSelected: colors[index] == selectedColor)
                        .onTapGesture {
                            selectedColor = colors[index]
                        }
                }
 
            }
            .padding()
        }
    }
}


struct ColorCircle: View {
    let color: Color
    let isSelected: Bool

    var body: some View {
        let isWhiteColor = color == .white

        return VStack {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 48, height: 48)
                if isSelected {
                    if isWhiteColor {
                        Image("whiteCheck")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    } else {
                        Image("ColorCheck")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
            }
            Text(color.name)
        }
        .overlay(
            isWhiteColor ? Circle()
                                .stroke(Color.gray, lineWidth: 2)
                                .padding(.top, -30)
                         : nil
        )
    }
}


extension Color {
    var name: String {
        switch self {
        case .green: return "Green"
        case .white: return "White"
        case .black: return "Black"
        case .gray: return "Gray"
        case .gray: return "Blue"
        case .orange: return "Orange"
        case .pink: return "Pink"
        default: return "Unknown"
        }
    }
}


struct ColorPickView_Previews: PreviewProvider {
    @State static var selectedColor: Color?

    static var previews: some View {
        ColorPickView(selectedColor: $selectedColor)
    }
}
