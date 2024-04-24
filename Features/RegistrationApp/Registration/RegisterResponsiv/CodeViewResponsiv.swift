//
//  CodeView.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 14/04/24.
//

import SwiftUI
import AssetKit

public struct CodeViewResponsiv: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: RegistrationViewModel

    public var body: some View {
        ZStack {
            VStack {
                customNavigationBar()
                    .frame(height: 60)
                HStack(alignment: .top) {
                    VStack {
                        leftChevronButton
                            .padding(.leading, 8)
                        customXButton()
                            .padding(.leading, 8)
                            .padding(.top, -2)
                    }
                    VStack(alignment: .leading) {
                        welcome
                        userPhoneOrEmail
                            .padding(.top, 8)
                        textFiled
                            .padding(.top, 40)
                        conformLabel
                            .padding(.top, 17)
                        timerLabel
                            .padding(.top, 7)
                        sendAgainButton
                            .padding(.top, 16)
                        nextButton
                            .padding(.top, (vm.remainingSeconds != 0) ? -24 : 32)
                            .animation(.easeInOut(duration: .animationDuration.normal))
                    }
                    .padding(.top, 44)
                    .padding(.leading, 27)
                    Spacer()
                }
                Spacer()
            }
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
        }
    }
    
    private func startTimer() {
        vm.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if vm.remainingSeconds > 0 {
                vm.remainingSeconds -= 1
            } else {
                stopTimer()
            }
        }
    }
        
    private func stopTimer() {
        vm.timer?.invalidate()
        vm.timer = nil
    }
}


extension CodeViewResponsiv {
    
    private var leftChevronButton: some View {
        Button(action: {
            withAnimation(.none) {
                // Закрыть текущий вид
                withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                    self.vm.isCodeViewPresented = false
                }
            }
        }, label: {
            Image(uiImage: Asset.Image.Icons.arrowLeft.image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
        })
        .frame(width: 36, height: 44)
    }
    
    private var xButton: some View { // xButton
        Button(action: {
            print("button tapped")
        }, label: {
            Image(uiImage: Asset.Image.Icons.closeX.image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
        })
        //.frame(width: 36, height: 44)
    }
    
    private var welcome: some View { // welcome
        Text("WELCOME")
            .font(.system(size: 40))
    }
    
    private var userPhoneOrEmail: some View { // email
        Text("Enter your phone number \nor email to continue")
            .font(.system(size: 16))
            .foregroundColor(.gray)
            .lineLimit(nil)
    }
    
    private var textFiled: some View { //textField
        ZStack(alignment: .leading) {
            Text("Code")
                .foregroundColor(.gray)
                .font(.system(size: vm.isEditing ? 11 : 16))
                .offset(y: vm.isEditing ? -26 : 0)
            
            TextField("", text: $vm.codeText, onEditingChanged: { editing in
                withAnimation(.easeInOut(duration: 0.7)) {
                    vm.isEditing = editing
                }
            })
            .textFieldStyle(PlainTextFieldStyle())
            .frame(width: 302, height: 48)
            .keyboardType(.numberPad)
        }
        .overlay(Rectangle().frame(height: 1).padding(.top, 8).foregroundColor(.gray), alignment: .bottom)
    }
    
    private var conformLabel: some View {
        Text("We have sent to your phone number \(vm.text) \na 5-digit number, please enter that code to confirm.")
            .font(.system(size: 11))
            .foregroundColor(.gray)
            .lineLimit(nil)
    }
    
    private var timerLabel: some View {
        Text("\(String(format: "%02d:%02d", vm.remainingSeconds / 60, vm.remainingSeconds % 60))")
                .font(.system(size: 11))
    }
    
    private var sendAgainButton: some View {
        Button(action: {
            print("Send Again tapped")
                
            vm.remainingSeconds = 55
            stopTimer()
            startTimer()
            
        }) {
            Image(systemName: "repeat")
                .resizable()
                .frame(width: 18, height: 18, alignment: .leading)
                .foregroundColor(.black)
            Text("SEND AGAIN")
                .font(.system(size: 13))
                .foregroundColor(.black)
        }
        .frame(width: 150, height: 40)
        .background(Color(red: 246/255, green: 246/255, blue: 246/255))
        .cornerRadius(100)
        .opacity((vm.remainingSeconds != 0) ? 0 : 1)
        .animation(.easeInOut(duration: .animationDuration.normal))
    }
    
    private var nextButton: some View {
        Button(action: {
            print("next button tapped!")
            
            
        }) {
            Text("ENTER")
                .frame(width: 302, height: 56)
                .background(Color(red: 10/255, green: 10/255, blue: 10/255))
                .foregroundColor(.white)
                .cornerRadius(100)
        }
    }
}

//#Preview {
//    @StateObject var vm = RegistrationViewModel()
//    CodeView().environmentObject(vm)
//}
