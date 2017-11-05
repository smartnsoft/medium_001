//
//  SafeAreaViewController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

final class SafeAreaViewController: ViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var ibTableView: UITableView!
  @IBOutlet weak var ibToolbar: UIToolbar!
  
  // MARK: Properties
  
  fileprivate let colors: [UIColor] = [
    .purple, ColorName.indigo.color, .blue, .green, .yellow, .orange, .red,
    .purple, ColorName.indigo.color, .blue, .green, .yellow, .orange, .red,
    .purple, ColorName.indigo.color, .blue, .green, .yellow, .orange, .red,
    .purple, ColorName.indigo.color, .blue, .green, .yellow, .orange, .red,
    .purple, ColorName.indigo.color, .blue, .green, .yellow, .orange, .red,
    .purple, ColorName.indigo.color, .blue, .green, .yellow, .orange, .red,
    .purple, ColorName.indigo.color, .blue, .green, .yellow, .orange, .red
  ]
  
  // MARK: - Initializers
  
  // MARK: - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
    self.demo()
  }
  
  @available(iOS 11.0, *)
  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    
    log.debug("safeAreaInsets: \(self.view.safeAreaInsets)")
  }
  
  // MARK: - Internal methods

  // MARK: - Private methods
  
  private func configureView() {
    self.title = MainTableViewController.Item.safeArea.rawValue
    self.ibTableView.register(cellType: DetailTableViewCell.self)
    let scrollView = self.ibTableView as UIScrollView
    scrollView.delegate = self
  }
  
  private func demo() {
    if #available(iOS 11.0, *) {
      
      // Safe Area
      // Describes area of view not occluded  by ancestors
      // Available as insets or layout guide
      // Incorporates overscan compensation insets
      
      // Add additional Safe Area Insets:
      self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: self.ibToolbar.bounds.height, right: 0)
      
      // A Boolean value indicating whether the view's layout margins are updated automatically to reflect the safe area.
//      self.view.insetsLayoutMarginsFromSafeArea = true
    }
  }
}

// MARK: - UITableViewDataSource
extension SafeAreaViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.colors.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: DetailTableViewCell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailTableViewCell.self)
    let color = self.colors[indexPath.row]
    cell.configure(withColor: color, indexPath: indexPath)
    return cell
  }
}

// MARK: - UIScrollViewDelegate
extension SafeAreaViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
  }
  
  @available(iOS 11.0, *)
  func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
    log.debug("adjustedContentInset: \(scrollView.adjustedContentInset)")
  }
}
