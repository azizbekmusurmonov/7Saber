//
//  OnBoardingView.swift
//  OnBording
//
//  Created by Turonboyev Ismatillokhon on 13/05/24.
//

import SwiftUI
import Core

struct OnBoardingView: View {
    
    @State private var totalPages = 3
    @State private var currentPage = 0
    @State private var showSecondView: Bool = false
    let isShowRegistrView: () -> ()
    
    var body: some View {
        TabView(selection:$currentPage){
           
                WalkScreen1()
                .tag(0)
           
                WalkScreen2()
                .tag(1)
           
                WalkScreen3()
                .tag(2)
            
                WalkScreen4()
                .tag(3)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .edgesIgnoringSafeArea(.all)
        .overlay(
            Button(action: {
                withAnimation(.easeInOut){
                    if currentPage < totalPages {
                        currentPage += 1
                    } else {
                        showSecondView.toggle()
                    }
                }
            }, label: {
                Image(systemName: currentPage <  totalPages ? "chevron.right" : "checkmark.circle")
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 56,height: 56)
                    .background(Color.black)
                    .clipShape(Circle())
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.gray.opacity(1.3),lineWidth:3)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white,lineWidth:3)
                                .rotationEffect(.init(degrees: -90))
                        }
                            .padding(-15)
                    )
            })
            .fullScreenCover(isPresented: $showSecondView, content: {
                SelectCountryView(didChoosedLanguage: { locale in
                    isShowRegistrView()
                    DataStorage.storage.save(locale, for: .language)
                })
            })
            .padding(.bottom)
            ,alignment: .bottom
        )
        .overlay(
            HStack {
                Image("saberImage")
                Spacer()
                
                
                Button(action: {
                    currentPage += 3
                }, label: {
                    Text("Skip".uppercased())
                        .font(.system(size: 16))
                })
                .accentColor(.white)
            }
                .padding()
            ,alignment: .top
        )
        
    }
}

#Preview {
    OnBoardingView {
        
    }
}

