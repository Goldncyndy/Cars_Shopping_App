//
//  Dashboard.swift
//  CarsShoppingApp
//
//  Created by Decagon on 13/02/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
// MARK: Create instance of viewControllers
      navigationController?.isNavigationBarHidden = true
        let dashboard = HomeViewController()
        let favoriteViewController = FavoriteViewController()
        let notificationViewController = NotificationViewController()
        let chatViewController = ChatViewController()
// MARK: Assign viewController to tab Bar
      self.setViewControllers([dashboard, favoriteViewController, notificationViewController, chatViewController], animated: false)
      guard let items = self.tabBar.items else { return }
      let images = ["house.fill", "magnifyingglass", "bell.fill", "message.fill"]
      for item in 0...3 {
        items[item].image = UIImage(systemName: images[item])
      }
// MARK: Changing tint Color
      self.tabBar.tintColor = .gray
    }
}
