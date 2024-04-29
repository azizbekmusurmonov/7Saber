//
//  RegistrationViewModel.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 03/04/24.
//

import SwiftUI
import Combine

public class RegistrationViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var isEditing: Bool = false
    @Published var showNextView = false
    @Published var isCodeViewPresented = false
    @Published var codeText: String = ""
    @Published var timer: Timer?
    @Published var remainingSeconds = 3
    
    public init () { }
}
