//
//  MainTableViewCell.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit
import Reusable

final class MainTableViewCell: UITableViewCell, Reusable {
  
  // MARK: Outlets
  
  // MARK: Properties
  
  // MARK: - Overrides
  
  // MARK: - Internal methods
  
  func configure(with item: MainTableViewController.Item) {
    self.textLabel?.text = item.rawValue
  }
  
  // MARK: - Private methods
  
  // MARK: - Actions
}
