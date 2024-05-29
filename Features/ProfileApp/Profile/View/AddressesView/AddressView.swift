//
//  AddressView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import Core
import AssetKit

struct AddressView: View {
    
    @EnvironmentObject var vm: AddressesViewModel
    @StateObject var profileData = AddressesViewModel()
    
    @State var addLocationView = false
    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        
        VStack(spacing: .zero) {
            
            navBar
            Spacer()
            
            if vm.items.isEmpty {
                AddressesIsEmpty()
                Spacer()
            } else {
                
                ScrollView {
                    VStack(spacing: .zero) {
                        
                        ForEach(vm.items, id: \.self) { item in
                            AddressItemView(item: item)
                            Divider()
                        }
                        .padding()
                    }
                }
            }
            AddButton(title: "ADD NEW ADDRESS", buttonPressed:{
                addLocationView = true
            } )
            .sheet(isPresented: $addLocationView) {
                AddNewAddress()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension AddressView {
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "ADDRESSES ", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
    }
}

#Preview {
    AddressView()
}
