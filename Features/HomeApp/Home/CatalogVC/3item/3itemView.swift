//
//  3itemView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//
import SwiftUI



struct ThreeItemView: View {
    @State private var isBottomSheetPresented = false

    var body: some View {
        VStack(spacing: 0) {
            Divider()

            ItemRow(title: "CLOTHES", action: {
                self.isBottomSheetPresented = true
            })
            .padding()
            Divider()

            ItemRow(title: "SHOES", action: { })
                .padding()
            Divider()

            ItemRow(title: "ACCESSORIES", action: { })
                .padding()
            Divider()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $isBottomSheetPresented) {
            BottomSheetView(isPresented: self.$isBottomSheetPresented, title: "Clothes")
        }
    }
}

struct ItemRow: View {
    var title: String
    var action: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 23))
                .fontWeight(.thin)
                .padding(.leading)
                .onTapGesture {
                    action()
                }

            Spacer()

            Image(systemName: "chevron.right")
                .padding(.trailing)
        }
        .background(Color.white)
        .padding(.vertical, 5)
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isPresented: .constant(true), title: "Clothes")
    }
}
