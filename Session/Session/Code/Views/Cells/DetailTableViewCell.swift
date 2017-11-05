//
//  DetailTableViewCell.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit
import Reusable

final class DetailTableViewCell: UITableViewCell, Reusable {
  
  // MARK: Outlets
  
  // MARK: Properties
  
  // MARK: - Overrides
  
  // MARK: - Internal methods
  
  func configure(withColor color: UIColor, indexPath: IndexPath) {
    self.contentView.backgroundColor = color
    self.textLabel?.text = "\(indexPath)"
    self.detailTextLabel?.text = "\(color)"
  }
  
  // MARK: - Private methods
  
  // MARK: - Actions
}
