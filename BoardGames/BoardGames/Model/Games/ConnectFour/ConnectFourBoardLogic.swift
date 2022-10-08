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
    func isFull() -> Bool {
        for column in 0...5 {
            for row in 0...6 {
                if board[column][row].isEmpty() {
                    return false
                }
            }
        }
        return true
    }
}

//MARK: - Cheking Wins
extension ConnectFourViewController {
    func checkWin() -> Bool {
        if horizontalWin() || verticalWin() || diagonalWin() {
            return true
        } else {
            return false
        }
    }
    
    func horizontalWin() -> Bool {
        for column in 0...5 {
            var consecutive = 0
            for row in 0...6{
                if board[column][row].state == currentTurn.state {
                    consecutive += 1
                    if consecutive == 4 {
                        return true
                    }
                } else { consecutive = 0 }
            }
        }
        return false
    }
    func verticalWin() -> Bool {
        return false
    }
    func diagonalWin() -> Bool {
        return false
    }
}

//MARK: - Pop alert when game finish and reset the game
extension ConnectFourViewController {
    
    func showAlert(title: String, messgae: String) {
        let alert = UIAlertController(title: title, message: messgae, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Reset", style: .default) { _ in
            self.resetBoard()
            self.currentTurn.state = .Yellow
            self.cv.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

