//
//  String.swift
//  Core
//
//  Created by Asadbek Yoldoshev on 15/05/24.
//

import Foundation

public extension String {
    var isNumber: Bool {
        CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
}
