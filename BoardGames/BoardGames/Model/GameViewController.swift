//
//  GameViewController.swift
//  BoardGames
//
//  Created by Huang Yan on 10/4/22.
//

import UIKit
class GameViewController: UIViewController {
    
    private var gameName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setGameName(name: String) {
        gameName = name
    }
    public func getGameName() -> String {
        return gameName
    }
    
}
