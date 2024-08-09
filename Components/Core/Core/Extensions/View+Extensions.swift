//
//  View+Extensions.swift
//  Core
//
//  Created by applebro on 09/08/24.
//

import Foundation
import SwiftUI

public extension View {
    func scrollable(axis: Axis.Set = .vertical) -> ScrollView<Self> {
        ScrollView(axis) {
            self
        }
    }
    
    func horizontal(alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vertical(alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
