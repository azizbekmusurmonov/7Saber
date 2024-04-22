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
                        .font(.title)
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
                            .padding(12)
                    }
                }
            }
            Divider()
        }
        .frame(height: 60)
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
                        .frame(width: 32, height: 32)
                        .padding(12)
                }
            } else {
                Image(uiImage: leftImage) //left image
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(12)
            }
        }
    }
}
