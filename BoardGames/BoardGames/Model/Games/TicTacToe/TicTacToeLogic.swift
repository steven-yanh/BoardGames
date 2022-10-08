//
//  TicTacToeLogic.swift
//  BoardGames
//
//  Created by Huang Yan on 10/8/22.
//

import UIKit
//MARK: - ChekingWinner
extension TicTacToeViewController {
    func checkIfWin() -> Bool {
        let boardString = makeArr()
        
        if checkHorizontal(from: 0, boardString) || checkHorizontal(from: 3, boardString) || checkHorizontal(from: 6, boardString) {
            return true
        }
        if checkVertical(from: 0, boardString) || checkVertical(from: 1, boardString) || checkVertical(from: 2, boardString) {
            return true
        }
        if checkDiagonal(boardString) {
            return true
        }
        return false
    }
    private func makeArr() -> [String] {
        var result = [String]()
        result.append(i0.getText())
        result.append(i1.getText())
        result.append(i2.getText())
        result.append(i3.getText())
        result.append(i4.getText())
        result.append(i5.getText())
        result.append(i6.getText())
        result.append(i7.getText())
        result.append(i8.getText())
        return result
    }
    func isFull() -> Bool {
        let boardString = makeArr()
        for char in boardString {
            if char == " " {
                return false
            }
        }
        return true
    }
    private func checkHorizontal(from index:Int, _ boardString: [String]) -> Bool {
        if boardString[index] == boardString[index+1] && boardString[index+1] == boardString[index+2] && boardString[index] != " " {
            return true
        }
        return false
    }
    private func checkVertical(from index: Int, _ boardString: [String]) -> Bool {
        if boardString[index] == boardString[index+3] && boardString[index+3] == boardString[index+6] && boardString[index] != " " {
            return true
        }
        return false
    }
    func checkDiagonal(_ boardString: [String]) -> Bool {
        if boardString[0] == boardString[4] && boardString[4] == boardString[8] && boardString[0] != " " {
            return true
        }
        if boardString[2] == boardString[4] && boardString[4] == boardString[6] && boardString[2] != " " {
            return true
        }
        return false
    }
}


//MARK: - Animations
extension TicTacToeViewController {
    func animateArrow(to point: CGFloat) {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.arrowConstrain?.constant = point
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()
    }
}

//MARK: - Reset board
extension TicTacToeViewController {
    @objc func resetBoard(_ sender: UIButton) {
        if didMove {
            DispatchQueue.main.async {
                self.resetButtons()
                self.switchSide()
                self.resetForNextPlayer()
                self.didMove = false
            }
        }
    }
    func resetButtons() {
        i0.titleLabel?.text = " "
        i0.setTitle(" ", for: .normal)
        i1.titleLabel?.text = " "
        i1.setTitle(" ", for: .normal)
        i2.titleLabel?.text = " "
        i2.setTitle(" ", for: .normal)
        i3.titleLabel?.text = " "
        i3.setTitle(" ", for: .normal)
        i4.titleLabel?.text = " "
        i4.setTitle(" ", for: .normal)
        i5.titleLabel?.text = " "
        i5.setTitle(" ", for: .normal)
        i6.titleLabel?.text = " "
        i6.setTitle(" ", for: .normal)
        i7.titleLabel?.text = " "
        i7.setTitle(" ", for: .normal)
        i8.titleLabel?.text = " "
        i8.setTitle(" ", for: .normal)
    }
    func resetForNextPlayer(winner: String? = nil) {
        if let winner = winner { // we have winner let other start first
            if winner == roundForPlayer {
                if roundForPlayer == "X" {
                    startFor(player: "O")
                } else {
                    startFor(player: "X")
                }
            } else {
                startFor(player: roundForPlayer)
            }
        } else { // no winner let player start first again
            startFor(player: roundForPlayer)
        }
    }
}
