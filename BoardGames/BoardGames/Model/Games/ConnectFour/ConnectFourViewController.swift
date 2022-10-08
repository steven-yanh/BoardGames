//
//  ConnectFourViewController.swift
//  BoardGames
//
//  Created by Huang Yan on 10/6/22.
//

import Foundation
import UIKit
class ConnectFourViewController: GameViewController {
    
    let turnLabel = UILabel()
    let turnImage = UIImageView()
    
    var board = [[ConnectFourBoardItem]]()
    var currentTurn = ConnectFourBoardItem(state: .Yellow)
    
    weak var cv: UICollectionView!
    
    override func loadView() {
        super.loadView()
        setupBoard()
    }
    func setupBoard() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let width = UIScreen.main.bounds.width
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: width),
            collectionView.heightAnchor.constraint(equalToConstant: width*Double(Double(5)/7))
        ])
        self.cv = collectionView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCV()
        setupTitle()
    }
    func setupCV() {
        resetBoard()
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .systemBlue
        cv.register(ConnectFourCell.self, forCellWithReuseIdentifier: ConnectFourCell.reuseId)
    }
    func setupTitle() {
        turnLabel.translatesAutoresizingMaskIntoConstraints = false
        turnLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        turnLabel.text = "Current Turn"
        
        turnImage.translatesAutoresizingMaskIntoConstraints = false
        turnImage.image = UIImage(systemName: "circle.fill")
        turnImage.tintColor = .systemYellow
        
        view.addSubview(turnLabel)
        view.addSubview(turnImage)
        NSLayoutConstraint.activate([
            turnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            turnLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            turnLabel.heightAnchor.constraint(equalToConstant: 30),
            
            turnImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            turnImage.topAnchor.constraint(equalToSystemSpacingBelow: turnLabel.bottomAnchor, multiplier: 2),
            turnImage.heightAnchor.constraint(equalToConstant: 40),
            turnImage.widthAnchor.constraint(equalToConstant: 40),
            cv.topAnchor.constraint(equalToSystemSpacingBelow: turnImage.bottomAnchor, multiplier: 15)
        ])
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setCellSize()
    }
    func setCellSize() {
        let width = cv.frame.width / 8.5
        let height = cv.frame.height / 6
        let flowLayout = cv.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
}
//MARK: - Datasource
extension ConnectFourViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return board.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return board[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConnectFourCell.reuseId, for: indexPath) as! ConnectFourCell
        let boardItem = getBoardItem(indexPath)
        cell.circle.tintColor = boardItem.getCollor()
        return cell
    }
    
    
}

//MARK: - Delegate (Cheking Game Logic)
extension ConnectFourViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if insertBoardItem(indexPath) { //successfully insert a plate
            
            if checkWin() {
                showAlert(title: "Win", messgae: "We have a winner!")
            }
            
            if isFull() {
                showAlert(title: "Draw!", messgae: "No winner for this round")
            }
            currentTurn.switchSide()
            turnImage.tintColor = currentTurn.getCollor()
        }
        cv.reloadData()
    }
}
