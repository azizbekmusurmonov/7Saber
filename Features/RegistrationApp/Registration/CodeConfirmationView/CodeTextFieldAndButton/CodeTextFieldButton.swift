//
//  TextFieldNextButton.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI

struct CodeTextFieldButton: View {
    
    @EnvironmentObject var vm: RegisterMobillAppViewModel
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        Text("Code")
                            .foregroundColor(.gray)
                            .font(.system(size: vm.codeTextFieldIsEditing ? 11 : 16))
                            .offset(y: vm.codeTextFieldIsEditing ? -26 : 0)
                        
                        TextField("", text: $vm.codeText, onEditingChanged: { editing in
                            withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                                vm.codeTextFieldIsEditing = editing
                            }
                        })
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 114, height: 48)
                        .keyboardType(.emailAddress)
                    } //TextField
                    .overlay(Rectangle().frame(height: 1).padding(.top, 8).foregroundColor(.gray), alignment: .bottom)
                    
                    Text("We have sent to your phone number \(vm.numberText) \na 5-digit number, please enter that code to confirm.") // numberText
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                        .padding(.top, 16)
                    
                    Text("\(String(format: "%02d:%02d", vm.remainingSeconds / 60, vm.remainingSeconds % 60))") // timerText
                            .font(.system(size: 11))
                            .padding(.top, 7)
                    
                    Button(action: { // sendAgain Button
                        print("Send Again tapped")
                            
                        vm.remainingSeconds = 60
                        vm.stopTimer()
                        vm.startTimer()
                      
                        vm.sendCode()
                    }) {
                        Image(systemName: "repeat")
                            .resizable()
                            .frame(width: 18, height: 18, alignment: .leading)
                            .foregroundColor(.black)
                        Text("SEND AGAIN")
                            .font(.system(size: 13))
                            .foregroundColor(.black)
                    }
                    .frame(width: 128, height: 40)
                    .background(Color(red: 246/255, green: 246/255, blue: 246/255))
                    .cornerRadius(100)
                    .opacity((vm.remainingSeconds != 0) ? 0 : 1)
                    .animation(.easeInOut(duration: .animationDuration.normal))
                    .padding(.top, 21)
                    
                    Button(action: { //ENTER Button
                        print("NEXT Button Tapped")
                    }, label: {
                        Text("ENTER")
                    })
                    .frame(width: 313, height: 56)
                    .background(vm.codeText.isEmpty ? Color.gray : Color(red: 10/255, green: 10/255, blue: 10/255))
                    .foregroundColor(.white)
                    .cornerRadius(100)
                    .padding(.top, (vm.remainingSeconds != 0) ? -62 : 21)
                    .animation(.easeInOut(duration: .animationDuration.normal))

                    Spacer()
                }
                .padding(.leading, 40)
                Spacer()
            }
        }
    }
}

#Preview {
    CodeTextFieldButton()
}
