//
//  ViewController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: Outlets
  
  // MARK: Properties
  
  // MARK: - Initializers
  
  deinit {
    log.verbose("deinit \(self)")
  }
  
  // MARK: - Overrides

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  }
  
  // MARK: - Internal methods

  // MARK: - Private methods
}
