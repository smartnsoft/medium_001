// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

protocol StoryboardType {
  static var storyboardName: String { get }
}

extension StoryboardType {
  static var storyboard: UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }
}

struct SceneType<T: Any> {
  let storyboard: StoryboardType.Type
  let identifier: String

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

struct InitialSceneType<T: Any> {
  let storyboard: StoryboardType.Type

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

protocol SegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
  enum Insets: StoryboardType {
    static let storyboardName = "Insets"

    static let insetsViewController = SceneType<Session.InsetsViewController>(storyboard: Insets.self, identifier: "InsetsViewController")
  }
  enum LargeTitles: StoryboardType {
    static let storyboardName = "LargeTitles"

    static let largeTitlesViewController = SceneType<Session.LargeTitlesViewController>(storyboard: LargeTitles.self, identifier: "LargeTitlesViewController")

    static let translucentViewController = SceneType<Session.TranslucentViewController>(storyboard: LargeTitles.self, identifier: "TranslucentViewController")
  }
  enum LaunchScreen: StoryboardType {
    static let storyboardName = "LaunchScreen"

    static let initialScene = InitialSceneType<UIViewController>(storyboard: LaunchScreen.self)
  }
  enum Margins: StoryboardType {
    static let storyboardName = "Margins"

    static let marginsViewController = SceneType<Session.MarginsViewController>(storyboard: Margins.self, identifier: "MarginsViewController")
  }
  enum SafeArea: StoryboardType {
    static let storyboardName = "SafeArea"

    static let safeAreaViewController = SceneType<Session.SafeAreaViewController>(storyboard: SafeArea.self, identifier: "SafeAreaViewController")
  }
}

enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
