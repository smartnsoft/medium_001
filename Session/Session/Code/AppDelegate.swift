//
//  AppDelegate.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder {

  // MARK: Outlets

  // MARK: Properties

  var window: UIWindow?

  // MARK: - Internal methods

  // MARK: - Private methods
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    SwiftyBeaver.configure()
    
    // Appearance
    UINavigationController.configure()
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let navigationController = NavigationController(rootViewController: MainTableViewController())
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
    
    return true
  }
}
