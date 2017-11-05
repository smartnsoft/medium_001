//
//  MainTableViewController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit
import Reusable

final class MainTableViewController: UITableViewController {

  enum Item: String {
    case margins = "Margins"
    case insets = "Insets"
    case safeArea = "Safe Area"
    case largeTitlesAlways = "Large Navigation Titles - always"
    case largeTitlesNever = "Large Navigation Titles - never"
    case largeTitlesAutomatic = "Large Navigation Titles - automatic"
    case largeTitleTextAttributes = "Large Title Text Attributes"
    case tabBar = "TabBar"
    case translucent = "Translucent"
  }
  
  // MARK: Outlets
  
  // MARK: Properties
  
  private let items: [Item] = [
    .margins,
    .insets,
    .safeArea,
    .largeTitlesAlways,
    .largeTitlesNever,
    .largeTitlesAutomatic,
    .largeTitleTextAttributes,
    .tabBar,
    .translucent
  ]
  
  // MARK: - Initializers
  
  // MARK: - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
//    if let transitionCoordinator = self.transitionCoordinator {
//      transitionCoordinator.animate(alongsideTransition: { [weak self] _ in
//        self?.navigationController?.configureAppearance()
//      }, completion: nil)
//    }
    self.navigationController?.configureAppearance()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MainTableViewCell = tableView.dequeueReusableCell(for: indexPath, cellType: MainTableViewCell.self)
    let item = self.items[indexPath.row]
    cell.configure(with: item)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = self.items[indexPath.row]
    switch item {
    case .margins:
      let marginsViewController = StoryboardScene.Margins.marginsViewController.instantiate()
      self.navigationController?.pushViewController(marginsViewController, animated: true)
    case .insets:
      let insetsViewController = StoryboardScene.Insets.insetsViewController.instantiate()
      self.navigationController?.pushViewController(insetsViewController, animated: true)
    case .safeArea:
      let safeAreaViewController = StoryboardScene.SafeArea.safeAreaViewController.instantiate()
      self.navigationController?.pushViewController(safeAreaViewController, animated: true)
    case .largeTitlesAlways:
      let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
      largeTitlesViewController.item = item
      self.navigationController?.pushViewController(largeTitlesViewController, animated: true)
    case .largeTitlesNever:
      let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
      largeTitlesViewController.item = item
      self.navigationController?.pushViewController(largeTitlesViewController, animated: true)
    case .largeTitlesAutomatic:
      let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
      largeTitlesViewController.item = item
      self.navigationController?.pushViewController(largeTitlesViewController, animated: true)
    case .largeTitleTextAttributes:
      let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
      largeTitlesViewController.item = item
      self.navigationController?.pushViewController(largeTitlesViewController, animated: true)
    case .tabBar:
      self.navigationController?.pushViewController(TabBarController(), animated: true)
    case .translucent:
      let translucentViewController = StoryboardScene.LargeTitles.translucentViewController.instantiate()
      self.navigationController?.pushViewController(translucentViewController, animated: true)
    }
  }
  
  // MARK: - Internal methods

  // MARK: - Private methods
  
  private func configureView() {
    self.title = "Main"
    self.view.backgroundColor = .white
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    self.tableView.register(cellType: MainTableViewCell.self)
    
    if #available(iOS 11.0, *) {
      self.navigationItem.largeTitleDisplayMode = .never
      self.navigationController?.navigationBar.largeTitleTextAttributes = nil
    }
  }
}
