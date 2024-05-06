//
//  DetailInfoView.swift
//  Wishlist
//
//  Created by Ismatillokhon on 5/6/24.
//

import SwiftUI

public struct DetailInfoView: View {
    
    public let imageURL: String
    public let title: String
    public let price: String
    
    public init(imageURL: String, title: String, price: String) {
        self.imageURL = imageURL
        self.title = title
        self.price = price
    }
    
    public var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: imageURL),
                transaction: Transaction(animation: .default),
                content: { phase in
                    if let image = phase.image { image
                        .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 124, height: 155)
                    }
                    else { ProgressView() }
                }
            )
            
            VStack(alignment: .leading,spacing: 0) {
                Text(title)
                    .font(.system(size: 13))
                
                Text(price)
                    .font(.system(size: 16))
                
                Spacer()
            }
            
            Spacer()
        }.background(Color.white)
            .padding(.horizontal, 16)
            .frame(height: 155)
    }
}
