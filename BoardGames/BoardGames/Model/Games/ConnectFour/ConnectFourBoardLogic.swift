//
//  ConnectFourBoardLogic.swift
//  BoardGames
//
//  Created by Huang Yan on 10/6/22.
//

import UIKit

extension ConnectFourViewController {
    func resetBoard() {
        board.removeAll()
        
        for _ in 0...5 {
            let rowArray = Array(repeating: ConnectFourBoardItem(state: .Empty), count: 7)
            board.append(rowArray)
        }
    }
    func getBoardItem(_ indexPath: IndexPath) -> ConnectFourBoardItem {
        return board[indexPath.section][indexPath.row]
    }
    func insertBoardItem(_ indexPath: IndexPath) -> Bool  {
        for i in stride(from: 5, to: -1, by: -1) {
            if board[i][indexPath.row].isEmpty() {
                board[i][indexPath.row].state = currentTurn.state
                return true
            }
        }
        return false
    }
}
