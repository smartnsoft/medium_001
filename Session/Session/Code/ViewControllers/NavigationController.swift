//
//  NavigationController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
  
  // MARK: Properties
  
  // MARK: - Initializers
  
  // MARK: - Overrides
  
  override var prefersStatusBarHidden: Bool {
    return self.topViewController?.prefersStatusBarHidden ?? false
  }
  
  override var shouldAutorotate: Bool {
    return self.topViewController?.shouldAutorotate ?? true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return self.topViewController?.supportedInterfaceOrientations ?? [.portrait, .landscape]
  }
  
  override var childViewControllerForStatusBarStyle: UIViewController? { return self.topViewController }
  
  override var childViewControllerForStatusBarHidden: UIViewController? { return self.topViewController }
  
  // MARK: - Internal methods
  
  // MARK: - Private methods
}
