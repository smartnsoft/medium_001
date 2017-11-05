//
//  UIKit+Session.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

extension UINavigationController {
  
  class func configure() {
    let appearance = UINavigationBar.appearance()
    appearance.barStyle = .default
    appearance.isTranslucent = true
  }
  
  func configureAppearance() {
    let appearance = UINavigationBar.appearance()
    self.navigationBar.barStyle = appearance.barStyle
//    let backgroundImage = appearance.backgroundImage(for: .default)
//    self.navigationBar.setBackgroundImage(backgroundImage, for: .default)
    self.navigationBar.setBackgroundImage(nil, for: .default)
//    self.navigationBar.shadowImage = appearance.shadowImage
    self.navigationBar.shadowImage = nil
    self.navigationBar.isTranslucent = true
  }
  
  func configureTranslucent() {
    self.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.isTranslucent = true
  }
}
