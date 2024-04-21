//
//  CodeView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI

struct CodeView: View {
    
    @StateObject var vm = CodeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                NavigationBar(showButton: vm.showButton)
                WelcomeView(welcomeText: "Enter confirmation code to \ncontinue the proccess")
                    .padding(.top, 150)
                CodeTextFieldButton()
                    .onAppear {
                        vm.startTimer()
                    }
                    .onDisappear {
                        vm.stopTimer()
                    }
                Spacer()
            }
        }
    }
}

#Preview {
    CodeView()
}
