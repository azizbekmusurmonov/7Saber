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
                    
                    FonImage(personalBundle: $vm.profileImage)
                    
                    PersonalInfoList()
                    
                    HStack(spacing: .zero) {
                       
                        SaveCancelButtons(title: "Cancel",
                                          color: Asset.Color.Button.grayCol.swiftUIColor, 
                                          textColor: Asset.Color.Text.primaryCol.swiftUIColor,
                                          buttonPressed: {
                            pop()
                        })
                        
                        SaveCancelButtons(title: "Save", 
                                          color: Asset.Color.Button.blackCol.swiftUIColor, textColor: Asset.Color.Text.whiteCol.swiftUIColor,
                                          buttonPressed: {
                            print("Save profile")
                        })
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
