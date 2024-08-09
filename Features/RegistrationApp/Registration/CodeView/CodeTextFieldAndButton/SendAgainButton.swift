//
//  SendAgainButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 01/05/24.
//

import SwiftUI
import AssetKit

struct SendAgainButton: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    let sendAgain: String
    
    init(sendAgain: String = Localizations.sendAgain) {
        self.sendAgain = sendAgain
    }
    
    var body: some View {
        Button(action: { // sendAgain Button
            print("Send Again tapped")
                
            vm.remainingSeconds = 60
            vm.stopTimer()
            vm.startTimer()
          
            if (vm.numberText.contains("@gmail.com") || vm.numberText.contains("@icloud.com")) {
                vm.sendCode(by: .email)
            } else if vm.numberText.contains("+998") && vm.numberText.count == 13 {
                vm.sendCode(by: .phone)
            }
        }) {
            Image(systemName: "repeat")
                .resizable()
                .frame(width: 18, height: 18, alignment: .leading)
                .foregroundColor(.black)
            Text(sendAgain)
                .font(.system(size: 13))
                .foregroundColor(.black)
        }
        .frame(width: 128, height: 40)
        .background(Color(red: 246/255, green: 246/255, blue: 246/255))
        .cornerRadius(100)
        .opacity((vm.remainingSeconds != 0) ? 0 : 1)
        .padding(.top, 21)
    }
}

#Preview {
    SendAgainButton()
        .environmentObject(RegisterMobillAppViewModel())
}
