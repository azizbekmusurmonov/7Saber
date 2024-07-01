//
//  BottomSheet.swift
//  Core
//
//  Created by Ismatillokhon on 28/06/24.
//

import SwiftUI

// Usage
// VStack {
//
// }.showSheetView(showSheet: Binding<Bool>, content: AnyView)

public extension View {
    func showSheetView(showSheet: Binding<Bool>, isUsingScrollViewOnContent: Binding<Bool>, content: AnyView) -> some View {
        self.modifier(
            SheetViewModifier(showSheet: showSheet, isFullSheet: isUsingScrollViewOnContent, content: content)
        )
    }
}

struct ScrollViewContentSizeKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct ContentSizeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear.preference(key: ScrollViewContentSizeKey.self, value: geometry.size)
            }
        )
    }
}

public extension View {
    func measureContentSize() -> some View {
        self.modifier(ContentSizeViewModifier())
    }
}

// Sheet view modifier
struct SheetViewModifier: ViewModifier {
    @Binding var showSheet: Bool
    @Binding var isFullSheet: Bool
    @State private var sheetHeight: CGFloat = .zero
    let sheetContent: AnyView
    
    init(showSheet: Binding<Bool>, isFullSheet: Binding<Bool>, content: AnyView) {
        self._showSheet = showSheet
        self.sheetContent = content
        self._isFullSheet = isFullSheet
    }
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showSheet) {
                if #available(iOS 16.0, *) {
                    sheetContent
                        .saveSize(in: $sheetHeight)
                        .presentationDetents(
                            (sheetHeight < UIScreen.main.bounds.height && !isFullSheet) ? [.height(sheetHeight), .large] : [.height(UIScreen.main.bounds.height), .large]
                        )
                        .presentationDragIndicator(.hidden)
                        .onPreferenceChange(ScrollViewContentSizeKey.self) { size in
                            print("sizeee", size.height)
                                self.sheetHeight = size.height
                            
                        }
                }
            }
    }
}


struct SizeCalculator: ViewModifier {
    
    @Binding var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onChange(of: proxy.size.height) { newValue in
                            withAnimation(.spring(duration: 0.3, bounce: 0.3)) {
                                height = proxy.size.height
                            }
                            print("sheet height", proxy.size.height)
                        }// we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            withAnimation(.spring(duration: 0.3, bounce: 0.3)) {
                                height = proxy.size.height
                            }
                        }
                }
            )
    }
}

extension View {
    func saveSize(in height: Binding<CGFloat>) -> some View {
        modifier(SizeCalculator(height: height))
    }
}
