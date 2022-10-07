//
//  ConnectFourBoardItem.swift
//  BoardGames
//
//  Created by Huang Yan on 10/6/22.
//

import UIKit
enum Tile {
    case Empty
    case Yellow
    case Red
}
struct ConnectFourBoardItem {
    
    var state: Tile
    
    
    mutating func toggle(_ currentTurn: Tile) {
        if self.isEmpty() {
            state = currentTurn
        }
    }
    mutating func switchSide() {
        if isRed() {
            state = .Yellow
        } else {
            state = .Red
        }
    }
    
    func isEmpty() -> Bool {
        return state == .Empty ? true : false
    }
    func isRed() -> Bool {
        return state == .Red ? true : false
    }
    func isYellow() -> Bool {
        return state == .Yellow ? true : false
    }
    func getCollor() -> UIColor {
        if isRed() {
            return .systemRed
        } else if isYellow() {
            return .systemYellow
        } else {
            return .white
        }
    }
}

