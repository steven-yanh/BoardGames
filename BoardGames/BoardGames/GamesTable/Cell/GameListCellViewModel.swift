//
//  GameListCellViewModel.swift
//  BoardGames
//
//  Created by Huang Yan on 10/5/22.
//

import UIKit
struct GameListCellViewModel {
    
    let gameName: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    
    init(gameName: String, imageName: String) {
        self.gameName = gameName
        self.imageName = imageName
    }
    func configure(with vm: GameListCellViewModel, for view: GameListCell) {
        view.gameName.text = vm.gameName
        view.gameImage.image = vm.image
    }
}
