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

public struct ItemsView: View {
    let items: [Item] = [
        Item(imageURL: URL(string: "https://images.uzum.uz/cof0s4a1om4pepe05dsg/original.jpg")!, itemName: "T-shirt Basic", itemPrice: "120,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cgohb17g49devoad2r7g/original.jpg")!, itemName: "Another Item", itemPrice: "100,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cgpt0hfg49devoadb7ng/original.jpg")!, itemName: "Yet Another Item", itemPrice: "150,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cntrtiepom4ma10q7h3g/t_product_540_high.jpg")!, itemName: "One More Item", itemPrice: "90,000 som"),
        Item(imageURL: URL(string: "https://images.uzum.uz/cm01etb2psag1e8tt8d0/original.jpg")!, itemName: "Last Item", itemPrice: "80,000 som")
    ]
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(items) { item in
                    ItemRow(item: item)
                    Divider()
                }
            }
            .padding()
        }
    }
}

struct ItemRow: View {
    var item: Item
    @State private var image: UIImage? = nil
    
    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 124, height: 155)
                
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(item.itemName)
                    .font(.title3)
                    .padding(.top, -25)
                
                Text(item.itemPrice)
                    .font(.subheadline)
                    .padding(.top, -15)
              
                Button(action: {
                    // Action when "Select Size" button is tapped
                }) {
                    Text("Select Size")
                        .font(.title2)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                    
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(25)
                }
                .padding(.top, 50)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
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

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}


