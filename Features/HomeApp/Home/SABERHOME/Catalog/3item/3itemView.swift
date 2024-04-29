//
//  3itemView.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//

import SwiftUI

struct ThreeItemView: View {
    
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
             
            ItemRow(title: "CLOTHES")
                .padding()
            Divider()
                
            ItemRow(title: "SHOES")
                .padding()
            Divider()
            ItemRow(title: "ACCESSORIES")
                .padding()
            Divider()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ItemRow: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 23))
                .fontWeight(.thin)
                .padding(.leading)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(.trailing)
        }
        .background(Color.white)
        .padding(.vertical, 5)
    }
}

struct ThreeItemView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeItemView()
    }
}
