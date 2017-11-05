//
//  LargeTitlesViewController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

final class LargeTitlesViewController: ViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var ibScrollView: UIScrollView!
  @IBOutlet weak var ibLoremLabel: UILabel!
  
  // MARK: Properties
  
  var item: MainTableViewController.Item?
  
  // MARK: - Initializers
  
  // MARK: - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
    self.demo()
  }
  
  // MARK: - Internal methods
  
  // MARK: - Private methods
  
  private func configureView() {
    self.automaticallyAdjustsScrollViewInsets = false
    if let item = self.item {
      switch item {
      case .largeTitlesAlways:
        self.title = "Always"
        let barButtonItem = BarButtonItem.withStyle(.automatic, action: { [unowned self] _ in
          let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
          largeTitlesViewController.item = MainTableViewController.Item.largeTitlesAutomatic
          self.navigationController?.pushViewController(largeTitlesViewController, animated: true)
        })
        let rightBarButtonItems = [barButtonItem]
        self.navigationItem.rightBarButtonItems = rightBarButtonItems
      case .largeTitlesNever:
        self.title = "Never"
        let barButtonItem = BarButtonItem.withStyle(.automatic, action: { [unowned self] _ in
          let largeTitlesViewController = StoryboardScene.LargeTitles.largeTitlesViewController.instantiate()
          largeTitlesViewController.item = MainTableViewController.Item.largeTitlesAutomatic
          self.navigationController?.pushViewController(largeTitlesViewController, animated: true)
        })
        let rightBarButtonItems = [barButtonItem]
        self.navigationItem.rightBarButtonItems = rightBarButtonItems
      case .largeTitlesAutomatic:
        self.title = "Automatic"
      case .largeTitleTextAttributes:
        self.title = "Text Attributes"
      case .tabBar:
        self.tabBarController?.navigationController?.title = self.tabBarController?.tabBarItem.title
      default:
        break
      }
    }
    self.ibLoremLabel.text = L10n.lorem
  }
  
  private func demo() {
    if #available(iOS 11.0, *) {
      self.navigationController?.navigationBar.prefersLargeTitles = true
      if let item = self.item {
        switch item {
        
        // Always
        case .largeTitlesAlways:
          self.navigationItem.largeTitleDisplayMode = .always
          self.navigationController?.navigationBar.largeTitleTextAttributes = nil
        
        // Never
        case .largeTitlesNever:
          self.navigationItem.largeTitleDisplayMode = .never
          self.navigationController?.navigationBar.largeTitleTextAttributes = nil
        
        // Automatic
        case .largeTitlesAutomatic:
          self.navigationItem.largeTitleDisplayMode = .automatic
          self.navigationController?.navigationBar.largeTitleTextAttributes = nil
        
        // Text Attributes
        case .largeTitleTextAttributes:
          self.navigationItem.largeTitleDisplayMode = .automatic
          let font: UIFont = UIFont.italicSystemFont(ofSize: 32)
          let titleTextAttributes: [NSAttributedStringKey: Any] = [.foregroundColor: UIColor.purple, .font: font]
          self.navigationController?.navigationBar.largeTitleTextAttributes = titleTextAttributes
        
        default:
          break
        }
      }
    }
  }
}
