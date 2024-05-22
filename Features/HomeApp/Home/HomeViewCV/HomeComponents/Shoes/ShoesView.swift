//
//  ShoesView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

struct SHoes: View {
    let imageURLs = [
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/4f37fca8-6bce-43e7-ad07-f57ae3c13142/air-force-1-07-mens-shoes-jBrhbr.png",
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b9fb6c22-9fdc-4e8c-8a76-1a253df72fdb/air-max-plus-drift-mens-shoes-FKwJ7w.png",
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/238a0f36-0cfe-4db9-b138-f7bcc8116a0a/air-force-1-07-lx-nbhd-mens-shoes-qnMX3r.png",
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/zjrheo7cjgrv6opt8txu/air-force-1-07-wb-mens-shoes-txRBM6.png",
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/s6dp2gck3oukxj9csz5y/air-max-270-mens-shoes-KkLcGR.png",
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/e6cd50c2-1a4a-4687-abc5-66c2e4a3a908/air-max-1-premium-mens-shoes-TSkTKs.png"
    ]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    let productInfo = [
        ("7BASIC 22 T-shirt", "150 000 UZS"),
        ("7BASIC 22 Dress", "350 000 UZS"),
        ("7BASIC 22 Hoodie", "199 000 UZS"),
        ("7BASIC 22 Bag", "250 000 UZS"),
        ("7BASIC 22 Hoodie", "199 000 UZS"),
        ("7BASIC 22 Bag", "250 000 UZS")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("SHOES")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.black)
                    .padding(.top, 15)
                    .padding(.leading, 0)
                
                Spacer()
                
                Text("SEE ALL")
                    .font(.system(size: 13))
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
                    .padding(.top, -6)
                    .padding(.leading, 0)
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(imageURLs.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: imageURLs[index])) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 130)
                                    .padding(.horizontal, 2)
                                    .padding(.top, 50)
                            } placeholder: {
                                AnimatedCircleProgressView()
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            
                            Text(productInfo[index].0)
                                .font(.system(size: 13))
                                .fontWeight(.medium)
                                .padding(.leading, 0)
                                .padding(.top, 90)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                            
                            Text(productInfo[index].1)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.leading, 0)
                                .padding(.top, 2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                            
                            Button(action: {
                                print("Button Tapped")
                            }) {
                                Image("plusonImage")
                                    .frame(width: 48, height: 48)
                                    .padding(.top, -125)
                                    .padding(.leading, 0)
                                    .padding(0)
                            }
                            .padding(.leading, 10)
                        }
                    }
                }
            }
            .padding(.horizontal, 0)
        }
    }
}

