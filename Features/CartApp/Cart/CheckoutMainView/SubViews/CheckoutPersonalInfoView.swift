//
//  CheckoutPersonalInfoView.swift
//  Cart
//
//  Created by Ismatillokhon on 01/07/24.
//

import SwiftUI
import Core
import AssetKit

struct CheckoutPersonalInfoView: View {
    
    @EnvironmentObject var vm: CheckoutMainViewModel
    var body: some View {
        HStack {
            Text(Localizations.personalInfo)
                .font(.sabFont(500, size: 16))
                .padding(16.dpHeight())
            
            Spacer()
            
            Text(vm.userName)
                .font(.sabFont(400, size: 16))
                .padding(16.dpHeight())
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}
