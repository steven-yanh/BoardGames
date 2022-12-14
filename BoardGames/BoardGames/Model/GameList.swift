//
//  GameList.swift
//  BoardGames
//
//  Created by Huang Yan on 10/4/22.
//

import Foundation
struct GameList {
    
    let games:[GameViewController] = [TicTacToeViewController(),ConnectFourViewController()]
    let gameNames: [String] = [K.tictactoe, K.connectFour]
    
    init () {
        for i in 0..<games.count {
            games[i].setGameAttributes(gameName: gameNames[i])
        }
    }
}
