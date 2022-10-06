//
//  GameViewController.swift
//  BoardGames
//
//  Created by Huang Yan on 10/4/22.
//

import UIKit
class GameViewController: UIViewController {
    
    private var gameName = ""
    private var gameImageName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setGameAttributes(gameName: String) {
        setGameName(name: gameName)
        setGameImageName(name: gameName)
    }
    
    private func setGameName(name: String) {
        gameName = name
    }
    private func setGameImageName(name: String) {
        gameImageName = name
    }
    public func getGameName() -> String {
        return gameName
    }
    public func getGameImageName() -> String {
        return gameImageName
    }
}
