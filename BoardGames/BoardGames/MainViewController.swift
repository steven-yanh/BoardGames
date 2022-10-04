//
//  MainViewController.swift
//  BoardGames
//
//  Created by Huang Yan on 10/4/22.
//

import UIKit

class MainViewController: UITabBarController {
    
    let ticTacToeVC = TicTacToeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuViewControllers()
        setupTabBar()
    }
    private func setuViewControllers() {
        let n1 = UINavigationController(rootViewController: ticTacToeVC)
        n1.navigationBar.prefersLargeTitles = true
        n1.title = "Games"
        
        n1.setTabBarImage(imageName: "gamecontroller.fill", title: "Games")
        hideNavigationBarLine(n1.navigationBar)
        
        let n2 = UINavigationController(rootViewController: N2())
        n2.setTabBarImage(imageName: "list.star", title: "Likes")
        
        let n3 = UINavigationController(rootViewController: N3())
        n3.setTabBarImage(imageName: "gearshape.fill", title: "Setting")
        
        viewControllers = [n1,n2,n3]
    }
    private func setupTabBar() {
        tabBar.backgroundColor = AppColor
        tabBar.isTranslucent = false
    }
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
            let img = UIImage()
            navigationBar.shadowImage = img
            navigationBar.setBackgroundImage(img, for: .default)
            navigationBar.isTranslucent = false
        }
}

class N2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }
}
class N3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

