//
//  NavigationController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
  
  struct Tab {
    let title: String
  }
  
  // MARK: Properties
  
  private let tabs: [Tab] = [
    Tab(title: L10n.tab0Title),
    Tab(title: L10n.tab1Title),
    Tab(title: L10n.tab2Title),
    Tab(title: L10n.tab3Title)
  ]
  
  // MARK: - Initializers
  
  deinit {
    log.verbose("deinit \(self)")
  }
  
  // MARK: - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.configureTabs(animated)
  }
  
  // MARK: - Internal methods
  
  // MARK: - Private methods
  
  private func configureView() {
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    self.automaticallyAdjustsScrollViewInsets = false
    self.delegate = self
    
    let barButtonItem = BarButtonItem.withStyle(.hideBottomBar, action: { [unowned self] _ in
      let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
      largeTitlesViewController.hidesBottomBarWhenPushed = true
      self.navigationController?.pushViewController(largeTitlesViewController, animated: true)
    })
    let rightBarButtonItems = [barButtonItem]
    self.navigationItem.rightBarButtonItems = rightBarButtonItems
    
    if #available(iOS 11.0, *) {
      self.navigationItem.largeTitleDisplayMode = .never
      self.navigationController?.navigationBar.largeTitleTextAttributes = nil
      self.selectedIndex = 0
      self.navigationItem.title = self.tabs.first?.title
    }
  }
  
  private func configureTabs(_ animated: Bool) {
    var viewControllers: [UIViewController] = []
    for (index, tab) in self.tabs.enumerated() {
      let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
      largeTitlesViewController.item = MainTableViewController.Item.tabBar
      largeTitlesViewController.tabBarItem = UITabBarItem(title: tab.title, image: nil, tag: index)
      viewControllers.append(largeTitlesViewController)
    }
    self.setViewControllers(viewControllers, animated: animated)
    self.selectedIndex = 0
  }
}

// MARK: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    self.navigationItem.title = self.tabs[self.selectedIndex].title
  }
}
