//
//  NetworkError.swift
//  NetworkManager
//
//  Created by Asadbek Yoldoshev on 23/04/24.
//

import Foundation

enum NetworkError: Error {
    case incorrectURL
    case incorrectStatusCode(Int)
    case couldnotDecodeModel(Error)
}
