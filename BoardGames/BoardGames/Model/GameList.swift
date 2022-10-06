//
//  GameList.swift
//  BoardGames
//
//  Created by Huang Yan on 10/4/22.
//

import Foundation
struct GameList {
    
    let games:[GameViewController] = [TicTacToeViewController()]
    let gameNames: [String] = [K.tictactoe]
    
    init () {
        for i in 0..<games.count {
            games[i].setGameAttributes(gameName: gameNames[0])
        }
    }
}
