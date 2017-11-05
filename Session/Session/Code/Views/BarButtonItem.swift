//
//  BarButtonItem.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

enum BarButtonStyle {
  case automatic
  case always
  case never
  case hideBottomBar
}

final class BarButtonItem: UIBarButtonItem {
  
  typealias BarButtonAction = (_ sender: BarButtonItem) -> Void
  
  // MARK: Properties
  
  private var barButtonAction: BarButtonAction?
  private(set) var barButtonStyle: BarButtonStyle = .automatic
  
  // MARK: - Initializers
  
  // MARK: - Overrides
  
  // MARK: - Internal methods
  
  static func withStyle(_ style: BarButtonStyle, action: BarButtonAction? = nil) -> UIBarButtonItem {
    let barButtonItem: BarButtonItem
    switch style {
    case .automatic:
      barButtonItem = BarButtonItem(title: "automatic", style: .plain, target: nil, action: #selector(executeAction))
    case .always:
      barButtonItem = BarButtonItem(title: "always", style: .plain, target: nil, action: #selector(executeAction))
    case .never:
      barButtonItem = BarButtonItem(title: "never", style: .plain, target: nil, action: #selector(executeAction))
    case .hideBottomBar:
      barButtonItem = BarButtonItem(title: "hideBottomBar", style: .plain, target: nil, action: #selector(executeAction))
    }
    barButtonItem.barButtonStyle = style
    barButtonItem.barButtonAction = action
    barButtonItem.target = barButtonItem
    return barButtonItem
  }
  
  // MARK: - Private methods
  
  // MARK: - Actions
  
  @objc
  private func executeAction() {
    self.barButtonAction?(self)
  }
}
