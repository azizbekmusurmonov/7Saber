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
    @StateObject private var addressFromViewModel = AddressFormViewModel()
    
    @State var addLocationView = false
    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        
        switch vm.viewState {
        case .show:
            VStack(spacing: .zero) {
                
                navBar
                Spacer()
           
                    ScrollView {
                        VStack(spacing: .zero) {
                            
                            ForEach(vm.items ?? [], id: \.self) { item in
                                AddressItemView(item: item)
                                Divider()
                            }
                            .padding()
                        }
                        .onChange(of: vm.message) { newValue in
                            guard let newValue else { return }
                            switch newValue {
                            case .succes(message: let message):
                                Snackbar.show(message: message, theme: .success)
                            case .error(message: let message):
                                Snackbar.show(message: message, theme: .error)
                            }
                        }
                    }
                }
                AddButton(title: "ADD NEW ADDRESS", buttonPressed:{
                    addLocationView = true
                }, isDisabled: $addressFromViewModel.isFormValid )
                .sheet(isPresented: $addLocationView) {
                    AddNewAddress()
                        .environmentObject(addressFromViewModel)
                
            }
            .navigationBarBackButtonHidden()
        case .loading:
            LoaderView()
        case .empty:
            navBar
            Spacer()
            AddressesIsEmpty()
        @unknown default:
            fatalError()
        }
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
