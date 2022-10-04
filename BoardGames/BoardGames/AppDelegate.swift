//
//  AppDelegate.swift
//  BoardGames
//
//  Created by Huang Yan on 10/2/22.
//

import UIKit
let AppColor = UIColor(displayP3Red: 177/255, green: 178/255, blue: 255/255, alpha: 1)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let mainViewController = MainViewController()

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey:Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window? .makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = TicTacToeViewController()
        window?.rootViewController = mainViewController
        return true
    }

}

