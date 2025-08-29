//
//  AppCoordiantor.swift
//  StyleUp
//
//  Created by Nevin Özkan on 29.08.2025.
//

import UIKit

class AppCoordinator {

    var window: UIWindow?
    var tabBarController: UITabBarController

    init(window: UIWindow?) {
        self.window = window
        self.tabBarController = UITabBarController()
    }

    func start() {
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let kombinVC = KombinViewController(nibName: "KombinViewController", bundle: nil)
        let favorilerVC = FavoriteViewController(nibName: "FavoriteViewController", bundle: nil)
        let profilVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)

        let homeNav = UINavigationController(rootViewController: homeVC)
        let kombinNav = UINavigationController(rootViewController: kombinVC)
        let favorilerNav = UINavigationController(rootViewController: favorilerVC)
        let profilNav = UINavigationController(rootViewController: profilVC)

        tabBarController.viewControllers = [homeNav, kombinNav, favorilerNav, profilNav]

        setupTabBarItems()

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    private func setupTabBarItems() {
        let items = [
            ("Ana Sayfa", "house"),
            ("Kombinler", "tshirt"),
            ("Favoriler", "star"),
            ("Profil", "person")
        ]

        guard let viewControllers = tabBarController.viewControllers else { return }

        for (index, vc) in viewControllers.enumerated() {
            vc.tabBarItem.title = items[index].0
            vc.tabBarItem.image = UIImage(systemName: items[index].1)
        }
    }
}
