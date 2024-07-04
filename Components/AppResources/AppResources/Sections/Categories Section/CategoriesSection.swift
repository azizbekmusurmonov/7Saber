//
//  CategoriesSection.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 28/06/24.
//

import SwiftUI

struct CategoriesSection: View {
    
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("CATEGORIES")
                    .font(.system(size: 19, weight: .bold))
                    .padding(.leading, 16)
                    .frame(height: 48)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.categories, id: \.id) { category in
                            CategoriesCell(category: category)
                        }
                    }
                }
                .padding(.leading, 16)
            }
        }
    }
}
