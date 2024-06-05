//
//  StringToExtension.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 05/06/24.
//

import SwiftUI

// Extension to split a string into chunks of a specified size
public extension String {
    func chunked(into size: Int) -> [String] {
        var chunks: [String] = []
        var startIndex = self.startIndex
        while startIndex < self.endIndex {
            let endIndex = index(startIndex, offsetBy: size, limitedBy: self.endIndex) ?? self.endIndex
            chunks.append(String(self[startIndex..<endIndex]))
            startIndex = endIndex
        }
        return chunks
    }
}
