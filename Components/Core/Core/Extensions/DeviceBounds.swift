//
//  DeviceBounds.swift
//  Core
//
//  Created by Azizbek Musurmonov   on 07/05/24.
//

import SwiftUI

public struct DeviceBounds {
    public static let safeArea = UIApplication.shared.firstWindow?.safeAreaInsets ?? .zero
    public static let bounds = UIApplication.shared.firstWindow?.bounds ?? .zero
}

public extension UIApplication {
    var firstWindow: UIWindow? {
        connectedScenes.first.flatMap { $0 as? UIWindowScene }?.windows.first { $0.isKeyWindow }
    }
}
//Ishlatilishi DeviceBounds.bounds.width 
