//
//  RegisterMobillAppViewModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import SwiftUI
import Combine

public class RegisterMobillAppViewModel: ObservableObject {
    
    @Published var registerLeftButton: Bool = false
    @Published var codeLeftButton: Bool = true
    @Published var numberText: String = ""
    @Published var isCodeViewPresented = false
    @Published var numberTextFieldIsEditing: Bool = false
    @Published var codeText: String = ""
    @Published var codeTextFieldIsEditing: Bool = false
    @Published var timer: Timer?
    @Published var remainingSeconds = 3
    
    public init () { }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                self.stopTimer()
            }
        }
    }
        
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
