// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Asset {
  public enum Color {
    public enum Button {
      public static let blackCol = ColorAsset(name: "BlackCol")
      public static let grayCol = ColorAsset(name: "GrayCol")
    }
    public enum Text {
      public static let primaryCol = ColorAsset(name: "PrimaryCol")
      public static let secondaryCol = ColorAsset(name: "SecondaryCol")
      public static let whiteCol = ColorAsset(name: "WhiteCol")
    }
  }
  public enum Image {
    public enum Cart {
      public static let minusCart = ImageAsset(name: "minusCart")
      public static let plusCart = ImageAsset(name: "plusCart")
    }
    public enum Home {
      public static let closeHome = ImageAsset(name: "closeHome")
      public static let locationHome = ImageAsset(name: "locationHome")
      public static let minusHome = ImageAsset(name: "minusHome")
      public static let plusHome = ImageAsset(name: "plusHome")
      public static let searchHome = ImageAsset(name: "searchHome")
    }
    public enum Icons {
      public enum CheckBox {
        public static let checkBo = ImageAsset(name: "checkBo")
        public static let checkBox = ImageAsset(name: "checkBox")
        public static let checkBoxFilled = ImageAsset(name: "checkBoxFilled")
      }
      public static let radioFilled = ImageAsset(name: "Radio Filled")
      public static let arrowDown = ImageAsset(name: "arrowDown")
      public static let arrowDownLeft = ImageAsset(name: "arrowDownLeft")
      public static let arrowDownRight = ImageAsset(name: "arrowDownRight")
      public static let arrowLeft = ImageAsset(name: "arrowLeft")
      public static let arrowRight = ImageAsset(name: "arrowRight")
      public static let arrowUp = ImageAsset(name: "arrowUp")
      public static let arrowUpLeft = ImageAsset(name: "arrowUpLeft")
      public static let arrowUpRight = ImageAsset(name: "arrowUpRight")
      public static let calendar = ImageAsset(name: "calendar")
      public static let checkCircleBroken = ImageAsset(name: "checkCircleBroken")
      public static let checkSquareBroken = ImageAsset(name: "checkSquareBroken")
      public static let chevronDown = ImageAsset(name: "chevronDown")
      public static let chevronLeft = ImageAsset(name: "chevronLeft")
      public static let chevronRight = ImageAsset(name: "chevronRight")
      public static let chevronUp = ImageAsset(name: "chevronUp")
      public static let clock = ImageAsset(name: "clock")
      public static let closeX = ImageAsset(name: "closeX")
      public static let closeXCircle = ImageAsset(name: "closeXCircle")
      public static let creditCard = ImageAsset(name: "creditCard")
      public static let done = ImageAsset(name: "done")
      public static let doneFilled = ImageAsset(name: "doneFilled")
      public static let edit = ImageAsset(name: "edit")
      public static let eye = ImageAsset(name: "eye")
      public static let eyeOff = ImageAsset(name: "eyeOff")
      public static let fastShopping = ImageAsset(name: "fastShopping")
      public static let globe = ImageAsset(name: "globe")
      public static let heart = ImageAsset(name: "heart")
      public static let heartFill = ImageAsset(name: "heartFill")
      public static let home = ImageAsset(name: "home")
      public static let loading = ImageAsset(name: "loading")
      public static let location = ImageAsset(name: "location")
      public static let menu = ImageAsset(name: "menu")
      public static let minus = ImageAsset(name: "minus")
      public static let phoneCall01 = ImageAsset(name: "phone-call-01")
      public static let placeholder = ImageAsset(name: "placeholder")
      public static let plus = ImageAsset(name: "plus")
      public static let plusCircle = ImageAsset(name: "plusCircle")
      public static let plusCrcleWhite = ImageAsset(name: "plusCrcleWhite")
      public static let radio = ImageAsset(name: "radio")
      public static let receiptCheck = ImageAsset(name: "receiptCheck")
      public static let `repeat` = ImageAsset(name: "repeat")
      public static let repeat04 = ImageAsset(name: "repeat04")
      public static let search = ImageAsset(name: "search")
      public static let settings = ImageAsset(name: "settings")
      public static let share = ImageAsset(name: "share")
      public static let shoppingBag = ImageAsset(name: "shoppingBag")
      public static let trash = ImageAsset(name: "trash")
      public static let trash2 = ImageAsset(name: "trash2")
    }
    public enum Logo {
      public static let logoBlack = ImageAsset(name: "logoBlack")
      public static let logoWhite = ImageAsset(name: "logoWhite")
    }
    public enum Navigation {
      public static let arrowLeftNav = ImageAsset(name: "arrowLeftNav")
      public static let basketNav = ImageAsset(name: "basketNav")
      public static let cancelNav = ImageAsset(name: "cancelNav")
      public static let catalogNav = ImageAsset(name: "catalogNav")
      public static let logoBlackNav = ImageAsset(name: "logoBlackNav")
      public static let logoWhiteNav = ImageAsset(name: "logoWhiteNav")
      public static let searchNav = ImageAsset(name: "searchNav")
      public static let userProfileNav = ImageAsset(name: "userProfileNav")
    }
    public enum Profile {
      public static let logOut = ImageAsset(name: "logOut")
    }
    public enum TabBars {
      public static let cart = ImageAsset(name: "cart")
      public static let catalog = ImageAsset(name: "catalog")
      public static let home = ImageAsset(name: "home")
      public static let profile = ImageAsset(name: "profile")
      public static let wishlist = ImageAsset(name: "wishlist")
    }
    public enum Wishlist {
      public static let closeWish = ImageAsset(name: "closeWish")
      public static let folder = ImageAsset(name: "folder")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
