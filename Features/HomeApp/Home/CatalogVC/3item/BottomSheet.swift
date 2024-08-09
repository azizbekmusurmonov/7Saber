//
//  BottomSheet.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

public struct BottomSheetView: View {
    @Binding var isPresented: Bool
    let title: String
    
    public var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    Text("CLOTHES")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    VStack(spacing: 0) {
                        SectionView(title: title, items: [
                            "Show all", "T-Shirt", "Dresses and Shorts", "Windbreakers and Bombers",
                            "Hoodies and Sweatshirts", "Sweaters", "Jackets & Vests",
                            "Ski and Snowboard Clothing", "Suits"
                        ])
                        SectionView(title: "Featured", items: [
                            "New arrivals", "Spring sales up to 50%"
                        ])
                        SectionView(title: "BY SPORTS", items: [
                            "Fitness", "Swimming", "Yoga", "Running", "Triathlon"
                        ])
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, UIApplication.shared.safeArea.bottom)
                    .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
                    .animation(.spring(), value: isPresented)
                    .edgesIgnoringSafeArea(.all)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SectionView: View {
    let title: String
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            Spacer()
            Text(title)
                .font(.headline)
                .padding(.horizontal)
                .foregroundColor(.gray)

            ForEach(items, id: \.self) { item in
                if item == "Show all" {
                    NavigationLink(destination: ShowAll()) {
                        HStack {
                            Text(item)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .buttonStyle(PlainButtonStyle())
                } else {
                    HStack {
                        Text(item)
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing)
                    }
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .onTapGesture {
                        // Handle item tap here
                    }
                }

                Divider()
            }
        }
    }
}

