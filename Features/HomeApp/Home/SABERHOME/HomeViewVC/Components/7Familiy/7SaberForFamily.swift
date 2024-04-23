//
//  7SaberForFamily.swift
//  SABERHOME
//
//  Created by islombek on 30/03/24.
//

import SwiftUI

struct Family: View {
    let imageURLs = [
        "https://assets.ajio.com/medias/sys_master/root/20231207/s4MU/6570e149afa4cf41f5b9489a/-473Wx593H-466859146-grey-MODEL.jpg",
        "https://a.lmcdn.ru/img600x866/M/P/MP002XW0PC5I_22400467_1_v1_2x.jpg",
        "https://a.lmcdn.ru/img600x866/M/P/MP002XB02E83_22345059_4_v1.jpeg"
    ]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    let productInfo = [
        ("FOR DAD"),
        ("FOR MOMMY"),
        ("FOR CHILD")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("7SABER FOR YOUR FAMILY")
                    .font(.system(size: 19, weight: .bold))
                    .padding(.leading, 0)
                    .padding(.top, 20)
                Spacer()
                
                LazyVStack(spacing: 0) {
                    ForEach(imageURLs.indices, id: \.self) { index in
                        ZStack(alignment: .leading) {
                            AsyncImage(url: URL(string: imageURLs[index])) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width)
                                    .padding(.top, 0)
                                   
                            } placeholder: {
                                AnimatedCircleProgressView()
                                    .padding()
                            }
                            
                            Text(productInfo[index])
                                .font(.system(size: 70))
                                .fontWeight(.thin)
                                .padding(.top, -140)
                                .rotationEffect(Angle(degrees: -90))
                                .foregroundColor(.gray)
                        }
                        
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }.padding(.top, 10)
                .padding(.horizontal, 0)
                .padding(.vertical, 0)
            }
        }.padding(.top, 40)
    }
}


