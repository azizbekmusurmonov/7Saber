//
//  Wishlistitems.swift
//  
//
//  Created by admin on 4/24/24.
//
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var imageURL: URL
    var itemName: String
    var itemPrice: String
}

struct ItemRow: View {
    var item: Item
    @State private var image: UIImage? = nil
    let selectSizeTapHandler: () -> ()
    
    var body: some View {
        HStack {
            
            AsyncImage(
                url: item.imageURL,
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
                Text(item.itemName)
                    .font(.system(size: 13))
                
                Text(item.itemPrice)
                    .font(.system(size: 16))
                  
                Spacer()
                Button(action: {
                    selectSizeTapHandler()
                }) {
                    Text("Select Size".uppercased())
                        .font(.system(size: 13))
                        .frame(width:111, height: 40)
                        .padding(.horizontal, 10)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(25)
                        .padding(.top,30)
                }
            }
            
            Spacer()
        }.background(Color.white)
        .onAppear {
            loadImage()
        }
    }
    
    func loadImage() {
        URLSession.shared.dataTask(with: item.imageURL) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}


