//
//  BaseNavigationBar.swift
//  Core
//
//  Created by Azizbek Musurmonov   on 06/04/24.
//

import SwiftUI

public struct BaseNavigationBar: View {
    public let title: String
    public let leftImage: UIImage
    public let rightImage: UIImage?
    public let leftButtonPressed: (() -> ())?
    public let rightButtonPressed: (() -> ())?
    public var isSearchMode: Bool = false
    
    public init(title: String, leftImage: UIImage, rightImage: UIImage? = nil, isSearchMode: Bool = false, leftButtonPressed: (() -> ())? = nil, rightButtonPressed: (() -> ())? = nil) {
        self.title = title
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.leftButtonPressed = leftButtonPressed
        self.rightButtonPressed = rightButtonPressed
        self.isSearchMode = isSearchMode
    }
    
    public var body: some View {
        VStack(spacing: .zero) {
            Divider()
                
            HStack(spacing: .zero) {
                
                leftImageView
                
                Divider()
                    
                if isSearchMode {
                    
                } else {
                    Spacer()
                    
                    Text(title)
                        .font(.system(size: 19, weight: .medium))
                    
                    Spacer()
                }
                
                if let rightImage {
                    Divider()
                    Button(action: {
                        rightButtonPressed?()
                    }) {
                        Image(uiImage: rightImage) //right Image
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 6)
                    }
                }
            }
            Divider()
        }
    }
}

extension BaseNavigationBar {
    private var leftImageView: some View {
        HStack(spacing: .zero) {
            if let leftButtonPressed {
                Button(action: {
                    leftButtonPressed()
                }) {
                    Image(uiImage: leftImage) //left image
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 8)
                }
            } else {
                Image(uiImage: leftImage)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, 8)
            }
        }
    }
}
