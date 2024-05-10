//
//  Snackbar.swift
//  Core
//
//  Created by Ismatillokhon on 5/8/24.
//

import SwiftMessages
import UIKit.UIImage

public enum SwiftMessagesTheme {
    case info
    case success
    case warning
    case error
}

@MainActor
public enum Snackbar {
    public static func show(message: String, theme: SwiftMessagesTheme) {
        DispatchQueue.main.async {
            SwiftMessages.show(config: barConfiguration, view: barView(message, theme))
        }
    }
}

private extension Snackbar {
    static let barConfiguration: SwiftMessages.Config = {
        var configuration = SwiftMessages.Config()
        configuration.presentationStyle = .top
        configuration.presentationContext = .window(windowLevel: .statusBar)
        configuration.duration = .seconds(seconds: 3)
        configuration.interactiveHide = true
        configuration.haptic = .success
        return configuration
    }()

    static func barView(_ message: String, _ theme: SwiftMessagesTheme) -> MessageView {
        let barView = MessageView.viewFromNib(layout: .cardView)
        switch theme {
        case .info:
            barView.configureTheme(.info)
        case .success:
            barView.configureTheme(.success)
        case .warning:
            barView.configureTheme(.warning)
        case .error:
            barView.configureTheme(.error)
        }

        barView.bodyLabel?.text = message
        barView.bodyLabel?.font = .systemFont(ofSize: 14)
        barView.bodyLabel?.textColor = .white
        barView.titleLabel?.text = nil

        barView.button?.tintColor = .white
        barView.button?.backgroundColor = .clear

        barView.button?.setImage(
            UIImage(named: "icon_close", in: Bundle(identifier: "com.uzpsb.olam.brandbook"), with: nil),
            for: .normal
        )

        barView.button?.setTitle(nil, for: .normal)
        barView.buttonTapHandler = { _ in SwiftMessages.hide() }

        (barView.backgroundView as? CornerRoundingView)?.cornerRadius = 16
        switch theme {
        case .info:
            barView.configureTheme(.info)
        case .success:
            barView.configureTheme(.success)
        case .warning:
            barView.configureTheme(.warning)
        case .error:
            barView.configureTheme(.error)
        }
        return barView
    }
}
