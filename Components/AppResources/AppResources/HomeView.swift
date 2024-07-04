//
//  HomeView.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 28/06/24.
//

import SwiftUI

public struct HomeView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    
    public init() { }
    
    public var body: some View {
        VStack {
            if vm.isLoading {
                iOSSpinner()
            } else {
                NavigationBar()
                    .environmentObject(vm)
                Spacer()
                ScrollView {
                    
                    AVPContentView()
                    CategoriesSection()
                        .environmentObject(vm)
                    NewCollectionView()
                        .environmentObject(vm)
                        .padding(.top, 60)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
