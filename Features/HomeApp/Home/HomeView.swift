//
//  HomeView.swift
//  Home
//
//  Created by Ismatillokhon on 3/26/24.
//

import SwiftUI

public struct HomeView: View {
    
    @EnvironmentObject var vm: HomeViiewModel
    
    
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            if vm.showLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                ScrollView {
                    VStack {
                        ForEach(0..<vm.posts.count, id: \.self) { index in
                            VStack {
                                Text(vm.posts[index].title)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                loginTF(text: $vm.tfString)
                                
                                ProductCell(title: $vm.posts[index].title, des: $vm.posts[index].body) {
                                    self.vm.fetchBoshqa()
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    var passTF: some View {
        VStack {
            
        }
    }
    
    func loginTF(text: Binding<String>) -> some View {
        VStack {
            TextField(text: text) {
                
            }
        }
    }
}

#Preview {
    HomeView()
}


struct ProductCell: View {
    
    @Binding var title: String
    @Binding var des: String
    
    let completion: (() -> ())
    
    var body: some View {
        VStack {
            Text(title)
            Text(des)
        }.onTapGesture {
            completion()
        }
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff
        )
    }
}
