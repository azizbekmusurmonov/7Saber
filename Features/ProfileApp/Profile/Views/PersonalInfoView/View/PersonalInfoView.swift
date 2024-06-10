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
    
    @EnvironmentObject var vm: ProfileViewModel
    @StateObject var profileData = ProfileViewModel()
    
    public init() { }
    
    var body: some View {
        VStack(spacing: .zero) {
            
            navBar
            
            ScrollView {
                VStack(spacing: .zero) {
                    
                    PersonalInfoList()
                    
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

extension PersonalInfoView {
    
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: "PERSONAL INFORMATION", leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed:  {
                print("leftButtonPressed")
                pop()
            })
        }
    }
}

#Preview {
    PersonalInfoView()
}
