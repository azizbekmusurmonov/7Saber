//
//  PersonalInfoView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 12/04/24.
//

import SwiftUI
import Core
import AssetKit

struct PersonalInfoView: View {
    
    @Environment(\.dismiss) var pop
    
    @EnvironmentObject var vm: PersonalInfoViewModel
    
    public init() { }
    
    var body: some View {
        VStack(spacing: .zero) {
            navBar
            ScrollView {
                VStack(spacing: .zero) {
                    PersonalInfoList()
                        .environmentObject(vm)
                }
                .onChange(of: vm.messageShow) { newValue in
                    guard let newValue else { return }
                    switch newValue {
                    case .succes(message: let message):
                        Snackbar.show(message: message, theme: .success)
                        pop()
                    case .error(message: let message):
                        Snackbar.show(message: message, theme: .error)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension PersonalInfoView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: Localizations.personalInformation, leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed:  {
                print("leftButtonPressed")
                pop()
            })
        }
    }
}

#Preview {
    PersonalInfoView()
}
