//
//  CategoriesCell.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 28/06/24.
//

import SwiftUI

struct CategoriesCell: View {
    let category: CategoriesModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: category.bg.src)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .cornerRadius(60)
            
            Text(category.name)
                .font(.system(size: 19))
                .padding([.leading, .bottom], 0) // отступы от левого и нижнего краев
        }
    }
}
