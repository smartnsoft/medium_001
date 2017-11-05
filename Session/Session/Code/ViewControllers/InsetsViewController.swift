//
//  InsetsViewController.swift
//  Session
//
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import UIKit

final class InsetsViewController: ViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var ibTableView: UITableView!
  
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
  
  // MARK: - Internal methods
  
  // MARK: - Private methods
  
  private func configureView() {
    self.title = MainTableViewController.Item.insets.rawValue
    self.ibTableView.register(cellType: DetailTableViewCell.self)
  }
  
  private func demo() {
    // @available(iOS, introduced: 7.0, deprecated: 11.0)
    // open var automaticallyAdjustsScrollViewInsets: Bool // Defaults to YES
    // Uncomment or change from top layout guide from view top
//    self.automaticallyAdjustsScrollViewInsets = false
    
    if #available(iOS 11.0, *) {
      // automatic:      Similar to .scrollableAxes, but for backward compatibility will also adjust the top & bottom contentInset
      //                 when the scroll view is owned by a view controller with automaticallyAdjustsScrollViewInsets = YES inside a navigation controller,
      //                 regardless of whether the scroll view is scrollable
      // scrollableAxes: Edges for scrollable axes are adjusted (i.e., contentSize.width/height > frame.size.width/height or alwaysBounceHorizontal/Vertical = YES)
      // never:          contentInset is not adjusted
      // always:         contentInset is always adjusted by the scroll view's safeAreaInsets
//      self.ibTableView.contentInsetAdjustmentBehavior = .never
    }
  }
}

// MARK: - UITableViewDataSource
extension InsetsViewController: UITableViewDataSource {
  
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
