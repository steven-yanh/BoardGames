//
//  ConnectFourCell.swift
//  BoardGames
//
//  Created by Huang Yan on 10/6/22.
//

import UIKit
class ConnectFourCell: UICollectionViewCell {
    
    static let reuseId = "ConnectFourCell"
    
    let circle = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.image = UIImage(systemName: "circle.fill")
        
        contentView.addSubview(circle)
        NSLayoutConstraint.activate([
            circle.topAnchor.constraint(equalTo: contentView.topAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            circle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            circle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
    
}
