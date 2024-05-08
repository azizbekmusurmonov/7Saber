//
//  DynamicBottomSheet.swift
//  Core
//
//  Created by Ismatillokhon on 5/1/24.
//

import SwiftUI

public struct HeightPreferenceKey: PreferenceKey {
    public static var defaultValue: CGFloat?

    public static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

public struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    public func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

public extension View {
    func readHeight() -> some View {
        self
            .modifier(ReadHeightModifier())
    }
}

// MARK: Usage
/*
 
 struct ContentView: View {
     @State var presentSheet: Bool = false
     @State var detentHeight: CGFloat = 0
     
     var body: some View {
         Button("Tap me") {
             self.presentSheet.toggle()
         }
         .sheet(isPresented: self.$presentSheet) {
             if #available(iOS 16.0, *) {
                 BottomView()
                     .readHeight()
                     .onPreferenceChange(HeightPreferenceKey.self) { height in
                         if let height {
                             self.detentHeight = height
                         }
                     }
                     .presentationDetents([.height(self.detentHeight)])
             } else {
                 BottomView()
             }
         }
     }
 }

 struct BottomView: View {
     var body: some View {
         VStack {
             Text("Hello")
             Text("World")
             Text("Hello")
             Text("World")
             Text("Hello")
             Text("World")
             Text("Hello")
             Text("World")
             Text("Hello")
             Text("World")
         }
     }
 }
 */
