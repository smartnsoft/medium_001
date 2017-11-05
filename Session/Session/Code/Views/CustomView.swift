//
//  CustomView.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit
import Reusable

final class CustomView: UIView, NibOwnerLoadable {
  
  // MARK: Outlets
  
  @IBOutlet weak var ibTitleLabel: UILabel!
  @IBOutlet weak var ibDescriptionLabel: UILabel!
  
  // MARK: Properties
  
  private var contentView: UIView {
    guard let contentView = self.subviews.first else {
      fatalError("\(NibOwnerLoadable.self) is supposed to add and load Nib content into a root subview.")
    }
    return contentView
  }
  
  // MARK: - Initializers
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.loadNibContent()
    self.configureView()
    self.demo()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  // MARK: - Overrides
  
  override func layoutMarginsDidChange() {
    super.layoutMarginsDidChange()
    
    if #available(iOS 11.0, *) {
      log.debug("\(self.contentView.directionalLayoutMargins)")
    } else {
      log.debug("\(self.contentView.layoutMargins)")
    }
  }
  
  @available(iOS 11.0, *)
  override func safeAreaInsetsDidChange() {
    super.safeAreaInsetsDidChange()
    
    log.debug("\(self.safeAreaInsets)")
  }
  
  // MARK: - Internal methods
  
  // MARK: - Private methods
  
  private func configureView() {
    self.ibTitleLabel.text = L10n.medium
    self.ibDescriptionLabel.text = L10n.topic
  }
  
  private func demo() {
    // default is false
    // Set to enable pass-through or cascading behavior of margins from this view’s parent to its children
    self.contentView.preservesSuperviewLayoutMargins = true
//    self.contentView.layoutMargins = .zero
  }
  
  // MARK: - Actions
}
