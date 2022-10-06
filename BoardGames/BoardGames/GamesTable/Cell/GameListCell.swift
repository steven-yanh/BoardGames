//
//  GameListCell.swift
//  BoardGames
//
//  Created by Huang Yan on 10/5/22.
//

import UIKit
class GameListCell: UITableViewCell {
    
    static let rowHeight: CGFloat = 120
    static let reuseId = "gameCell"
    
    let Hstack = UIStackView()
    let gameImage = UIImageView()
    let gameName = UILabel()
    let chevronImage = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        Hstack.translatesAutoresizingMaskIntoConstraints = false
        Hstack.axis = .horizontal
        Hstack.spacing = 24
        Hstack.distribution = .fill
        Hstack.alignment = .center
        
        gameImage.translatesAutoresizingMaskIntoConstraints = false
        gameImage.image = UIImage(named: "Error")
        
        gameName.translatesAutoresizingMaskIntoConstraints = false
        gameName.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        gameName.text = "Error"
        
        
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.image = UIImage(systemName: "chevron.right")
        chevronImage.tintColor = AppColor
        
        
    }
    private func layout() {
        addSubview(Hstack)
        Hstack.addArrangedSubview(gameImage)
        Hstack.addArrangedSubview(gameName)
        Hstack.addArrangedSubview(chevronImage)
        
        NSLayoutConstraint.activate([
            Hstack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            Hstack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.5),
            gameImage.heightAnchor.constraint(equalToConstant: 100),
            gameImage.widthAnchor.constraint(equalToConstant: 100),
            
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImage.trailingAnchor , multiplier: 1),
            chevronImage.heightAnchor.constraint(equalToConstant: 30),
            chevronImage.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    func configure(with vm: GameListCellViewModel, for: GameListCell) {
        vm.configure(with: vm, for: self)
    }
}
