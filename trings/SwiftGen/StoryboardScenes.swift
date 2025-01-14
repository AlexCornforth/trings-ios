// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length prefer_self_in_static_references
// swiftlint:disable type_body_length type_name
internal enum StoryboardScene {
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum MyWallet: StoryboardType {
    internal static let storyboardName = "MyWallet"

    internal static let initialScene = InitialSceneType<trings.MyWalletViewController>(storyboard: MyWallet.self)
  }
  internal enum PreviewPurchaseView: StoryboardType {
    internal static let storyboardName = "PreviewPurchaseView"

    internal static let initialScene = InitialSceneType<trings.PreviewPurchaseViewController>(storyboard: PreviewPurchaseView.self)

    internal static let previewPurchase = SceneType<trings.PreviewPurchaseViewController>(storyboard: PreviewPurchaseView.self, identifier: "PreviewPurchase")
  }
  internal enum PurchaseTokens: StoryboardType {
    internal static let storyboardName = "PurchaseTokens"

    internal static let initialScene = InitialSceneType<trings.PurchaseTokensViewController>(storyboard: PurchaseTokens.self)
  }
  internal enum SignIn: StoryboardType {
    internal static let storyboardName = "SignIn"

    internal static let initialScene = InitialSceneType<trings.SignInViewController>(storyboard: SignIn.self)
  }
  internal enum TreeMapView: StoryboardType {
    internal static let storyboardName = "TreeMapView"

    internal static let initialScene = InitialSceneType<trings.TreeMapViewController>(storyboard: TreeMapView.self)
  }
  internal enum WalkthroughGuide: StoryboardType {
    internal static let storyboardName = "WalkthroughGuide"

    internal static let initialScene = InitialSceneType<trings.WalkthroughGuideViewController>(storyboard: WalkthroughGuide.self)
  }
  internal enum WalkthroughPage: StoryboardType {
    internal static let storyboardName = "WalkthroughPage"

    internal static let initialScene = InitialSceneType<trings.WalkthroughPageViewController>(storyboard: WalkthroughPage.self)
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length prefer_self_in_static_references
// swiftlint:enable type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
  }
}

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
