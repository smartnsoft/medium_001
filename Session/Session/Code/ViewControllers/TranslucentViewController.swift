//
//  TranslucentViewController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

final class TranslucentViewController: ViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var ibScrollView: UIScrollView!
  @IBOutlet weak var ibLoremLabel: UILabel!
  
  // MARK: Properties
  
  // MARK: - Initializers
  
  // MARK: - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
    self.demo()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
//    if let transitionCoordinator = self.transitionCoordinator {
//      transitionCoordinator.animate(alongsideTransition: { [weak self] _ in
//        self?.navigationController?.configureTranslucent()
//      }, completion: nil)
//    }
  }
  
  // MARK: - Internal methods
  
  // MARK: - Private methods
  
  private func configureView() {
    self.navigationController?.configureTranslucent()
    
//    self.title = "NavigationBar Translucent"
    self.ibLoremLabel.text = L10n.lorem
  }
  
  private func demo() {
    if #available(iOS 11.0, *) {
      self.navigationItem.largeTitleDisplayMode = .never
      self.navigationController?.navigationBar.largeTitleTextAttributes = nil
      self.ibScrollView.contentInsetAdjustmentBehavior = .never
    }
  }
}
