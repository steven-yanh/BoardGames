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
}
