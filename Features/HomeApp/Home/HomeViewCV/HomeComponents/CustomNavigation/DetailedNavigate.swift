//
//  DetailedNavigate.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI



struct ShareViewController: UIViewControllerRepresentable {
    var shareItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No update needed
    }
}

struct Detailednavigation: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isShareSheetPresented = false
    @State private var isSersaTapped = false

    var body: some View {
        VStack {
     
            Divider()

            HStack {
                Button(action: {
                    print("Back button tapped")
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(12)
                        .foregroundColor(.black)
                }

                Divider()

                Spacer()

                Button(action: {
                    isShareSheetPresented.toggle()
                }) {
                    Image("share07")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 24, height: 24)
                        .padding(10)
                }
                .padding(7)

                Divider()

                Button(action: {
                    isSersaTapped.toggle()
                }) {
                    Image(isSersaTapped ? "sersaqizil" : "sersa")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(10)
                }
                .padding(7)
            }
            .frame(height: 40)
            Divider()
        }
        .background(Color.white)
        .ignoresSafeArea()
        .sheet(isPresented: $isShareSheetPresented) {
            ShareViewController(shareItems: ["Your share text here", URL(string: "https://7saber.uz/uz/category/48")!])
        }
    }
}
