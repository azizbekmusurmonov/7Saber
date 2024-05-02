//
//  ApprovedEmailOrPhoen.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 02/05/24.
//

import SwiftUI

struct ApprovedEmailOrPhone: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Phone number or Email")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                Text("vm.numberText")
                    .font(.system(size: 16))
            }
            .frame(width: UIScreen.main.bounds.width - 80, height: 48)
        }
        .overlay(
            Rectangle()
                .frame(height: 1)
                .padding(.top, 2).foregroundColor(.gray),
            alignment: .bottom
        )
    }
}

#Preview {
    ApprovedEmailOrPhone()
}
