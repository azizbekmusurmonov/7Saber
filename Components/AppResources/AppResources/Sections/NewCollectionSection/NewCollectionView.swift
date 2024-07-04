//
//  NewCollectionView.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 30/06/24.
//

import SwiftUI
import AssetKit

struct NewCollectionView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("NEW COLLECTION")
                        .font(.system(size: 19, weight: .bold))
                        .frame(height: 48)
                    
                    Spacer()
                    Button {
                        print("see all button tapped")
                    } label: {
                        Text("SEE ALL")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.newCollectionData, id: \.id) { newCollection in
                            NewCollectionCell(newCollection: newCollection)
                        }
                    }
                }
            }
        }
    }
}
