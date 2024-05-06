//
//  BottomSheetsNavBar.swift
//  Core
//
//  Created by Ismatillokhon on 5/6/24.
//

import SwiftUI
import AssetKit

public struct BottomSheetsNavBar: View {
    
    @Environment(\.dismiss) var pop
    
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        VStack {
            HStack {
                BaseText(title, .sabFont(600, size: 19))
                
                Spacer()
                
                Button(action: {
                    pop()
                }) {
                    Circle()
                        .setSize(40)
                        .foregroundColor(Asset.Color.Button.grayCol.swiftUIColor)
                        .overlay {
                            Image(uiImage: Asset.Image.Icons.closeX.image)
                                .setSize(20)
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 28)
            .frame(height: 80)
            
            Divider()
        }
    }
}

