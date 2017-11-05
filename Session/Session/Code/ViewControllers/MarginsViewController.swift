//
//  MarginsViewController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

final class MarginsViewController: ViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var ibCustomView: CustomView!
  
  // MARK: Properties
  
  // MARK: - Initializers
  
  // MARK: - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
    self.demo()
  }
  
  @available(iOS 11.0, *)
  override func viewLayoutMarginsDidChange() {
    super.viewLayoutMarginsDidChange()
    
    log.debug("\(self.view.directionalLayoutMargins)")
  }
  
  // MARK: - Internal methods
  
  // MARK: - Private methods
  
  private func configureView() {
    self.title = MainTableViewController.Item.margins.rawValue
  }
  
  private func demo() {
    // The view property of a UIViewController references the root view managed by the view controller.
    // The system enforced left and right margins depending on the size class (16 points for compact width and 20 points for regular)
    
    // Before iOS 11 you can't not change the layout margins of this view.
//    self.view.layoutMargins = UIEdgeInsets(top: self.view.layoutMargins.top,
//                                           left: 64,
//                                           bottom: self.view.layoutMargins.bottom,
//                                           right: 64)
    
    if #available(iOS 11.0, *) {
      // Setup left and right margins less than system values
//      self.view.layoutMargins = UIEdgeInsets(top: self.systemMinimumLayoutMargins.top,
//                                             left: 8,
//                                             bottom: self.systemMinimumLayoutMargins.bottom,
//                                             right: 0)
      
      // To make it, root view doesn't need to respect minimum system margins
//      self.viewRespectsSystemMinimumLayoutMargins = false
      
      // layoutMargins deprecated
//      self.view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: self.view.directionalLayoutMargins.top,
//                                                                   leading: 8,
//                                                                   bottom: self.view.directionalLayoutMargins.bottom,
//                                                                   trailing: 0)
    }
  }
}
