//
//  NewCollectionCell.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 30/06/24.
//

import SwiftUI

struct NewCollectionCell: View {
    
    let newCollection: NewCollectionDatum
//    let plusButtonTapped: () -> ()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomLeading) {
                    // Ваша AsyncImage здесь
                    AsyncImage(url: URL(string: newCollection.mainImg?.src ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 301, height: 376)

                    // Кнопка "plus" в левом нижнем углу с отступом 12
                    Button(action: {
                        print("plusButtonTapped")
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    }
                    .frame(width: 48, height: 48)
                    .background(Color.gray)
                    .cornerRadius(24)
                    .padding(.bottom, 12)
                    .padding(.leading, 12)
                }

                Text(newCollection.name ?? "")
                    .font(.system(size: 13))
                    .padding(.top, 8)
                Text(newCollection.price?.value?.description ?? "")
            }
        }
    }
}
