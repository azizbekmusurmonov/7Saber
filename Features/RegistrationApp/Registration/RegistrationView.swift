//
//  RegistrationView.swift
//  Registration
//
//  Created by Azizbek Musurmonov   on 02/04/24.
//

import SwiftUI

public struct RegistrationView: View {
    
    @StateObject var vm = RegistrationViewModel()
    
    public init () { }
    
    public var body: some View {
        ZStack {
            VStack {
                customNavigationBar()
                    .frame(height: 60)
                HStack(alignment: .top) {
                    xButton
                        .padding(.top, 46)
                        .padding(.leading, 8)
                    VStack(alignment: .leading) {
                        welcome
                        userPhoneOrEmail
                            .padding(.top, 8)
                        textFiled
                            .padding(.top, 40)
                        nextButton
                            .padding(.top, 32)
                    }
                    .padding(.top, 44)
                    .padding(.leading, 27)
                    Spacer()
                }
                Spacer()
            }.opacity(!vm.isCodeViewPresented ? 1 : 0)
            
            CodeView().environmentObject(vm)
                .opacity(!vm.isCodeViewPresented ? 0 : 1)
        }
    }
}

extension RegistrationView {
    
    private var xButton: some View { // xButton
        Button(action: {
            print("button tapped")
        }, label: {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
        })
        .frame(width: 36, height: 44)
    }
    
    private var welcome: some View { //welcome
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
            Text("Phone number or Email")
                .foregroundColor(.gray)
                .font(.system(size: vm.isEditing ? 11 : 16))
                .offset(y: vm.isEditing ? -26 : 0)
            
            TextField("", text: $vm.text, onEditingChanged: { editing in
                withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                    vm.isEditing = editing
                }
            })
            .textFieldStyle(PlainTextFieldStyle())
            .frame(width: 302, height: 48)
            .keyboardType(.emailAddress)
        }
        .overlay(Rectangle().frame(height: 1).padding(.top, 8).foregroundColor(.gray), alignment: .bottom)
    }
    
    private var nextButton: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: .animationDuration.normal)) {
                self.vm.isCodeViewPresented = true
            }
            
        }) {
            Text("NEXT")
                .frame(width: 302, height: 56)
                .background(vm.text.isEmpty ? Color.gray : Color(red: 10/255, green: 10/255, blue: 10/255))
                .foregroundColor(.white)
                .cornerRadius(100)
        }
    }
}
//
//#Preview {
//    RegistrationView()
//}

extension TimeInterval {
    
    static let animationDuration = AnimationDuration()
    struct AnimationDuration {
        let short = 0.3
        let normal = 0.5
        let long = 1.0
    }
}
