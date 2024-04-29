//
//  ExtentionToTimeInterval.swift
//  Registration
//
//  Created by Asadbek Yoldoshev on 21/04/24.
//

import Foundation

extension TimeInterval {
    
    static let animationDuration = AnimationDuration()
    struct AnimationDuration {
        let short = 0.3
        let normal = 0.5
        let long = 1.0
    }
}
