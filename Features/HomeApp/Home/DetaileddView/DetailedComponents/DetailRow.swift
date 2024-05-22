//
//  DetailRow.swift
//  Home
//
//  Created by islombek on 22/05/24.
//


import SwiftUI

struct DetaileRow: View {
    let items = ["DESCRIPTION", "PRODUCT DETAIL", "SHIPPING & RETURNS", "SUSTAINABILITY", "CARE INSTRUCTIONS"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(items, id: \.self) { item in
                HStack {
                    Text(item)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image("plus")
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 20)
                }
                .background(Color.white)
                .padding(.vertical, 10)
                Divider()
            }
        }
    }
}

