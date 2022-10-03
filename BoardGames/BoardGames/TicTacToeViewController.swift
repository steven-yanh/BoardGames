//
//  TicTacToeViewController.swift
//  BoardGames
//
//  Created by Huang Yan on 10/2/22.
//

import UIKit

class TicTacToeViewController: UIViewController {
    //title components
    let XLabel = UILabel()
    let scoreLabel = UILabel()
    let turnArrow = UIImageView()
    let OLabel = UILabel()
    var xScoreInt = 0 {
        didSet {
            scoreLabel.text = String(format: "%1d : %1d", arguments: [xScoreInt,oScoreInt])
        }
    }
    var oScoreInt = 0 {
        didSet {
            scoreLabel.text = String(format: "%1d : %1d", arguments: [xScoreInt,oScoreInt])
        }
    }
    
    
    
    //board components & logic
    let VStack = UIStackView()
    let HStackA = UIStackView()
    let HStackB = UIStackView()
    let HStackC = UIStackView()
    
    lazy var a1: UIButton = { return makeButton() }()
    lazy var a2: UIButton = { return makeButton() }()
    lazy var a3: UIButton = { return makeButton() }()
    lazy var b1: UIButton = { return makeButton() }()
    lazy var b2: UIButton = { return makeButton() }()
    lazy var b3: UIButton = { return makeButton() }()
    lazy var c1: UIButton = { return makeButton() }()
    lazy var c2: UIButton = { return makeButton() }()
    lazy var c3: UIButton = { return makeButton() }()
    
    var playerSign = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupBoard()
    }
    func setupTitle() {
        view.addSubview(XLabel)
        view.addSubview(turnArrow)
        view.addSubview(scoreLabel)
        view.addSubview(OLabel)
        view.addSubview(scoreLabel)
        
        XLabel.translatesAutoresizingMaskIntoConstraints = false
        turnArrow.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        OLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        XLabel.font = UIFont.systemFont(ofSize: 90)
        XLabel.text = "X"
        OLabel.font = UIFont.systemFont(ofSize: 90)
        OLabel.text = "O"
        turnArrow.image = UIImage(systemName: "arrowtriangle.up.fill")
        turnArrow.widthAnchor.constraint(equalToConstant: 40).isActive = true
        turnArrow.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scoreLabel.font = UIFont.systemFont(ofSize: 50)
        xScoreInt = 0 // triggers didset to show scoreLabel
        
        NSLayoutConstraint.activate([
            XLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3),
            XLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            OLabel.topAnchor.constraint(equalTo: XLabel.topAnchor),
            OLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            scoreLabel.topAnchor.constraint(equalToSystemSpacingBelow: XLabel.topAnchor, multiplier: 3),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            turnArrow.topAnchor.constraint(equalToSystemSpacingBelow: XLabel.bottomAnchor, multiplier: 1),
            turnArrow.leadingAnchor.constraint(equalToSystemSpacingAfter: XLabel.leadingAnchor, multiplier: 1)
        ])
        
    }
    func setupBoard() {
        view.addSubview(VStack)
        VStack.addArrangedSubview(HStackA)
        HStackA.addArrangedSubview(a1)
        HStackA.addArrangedSubview(a2)
        HStackA.addArrangedSubview(a3)
        VStack.addArrangedSubview(HStackB)
        HStackB.addArrangedSubview(b1)
        HStackB.addArrangedSubview(b2)
        HStackB.addArrangedSubview(b3)
        VStack.addArrangedSubview(HStackC)
        HStackC.addArrangedSubview(c1)
        HStackC.addArrangedSubview(c2)
        HStackC.addArrangedSubview(c3)
        
        VStack.translatesAutoresizingMaskIntoConstraints = false
        HStackA.translatesAutoresizingMaskIntoConstraints = false
        HStackB.translatesAutoresizingMaskIntoConstraints = false
        HStackC.translatesAutoresizingMaskIntoConstraints = false
        a1.translatesAutoresizingMaskIntoConstraints = false
        a2.translatesAutoresizingMaskIntoConstraints = false
        a3.translatesAutoresizingMaskIntoConstraints = false
        b1.translatesAutoresizingMaskIntoConstraints = false
        b2.translatesAutoresizingMaskIntoConstraints = false
        b3.translatesAutoresizingMaskIntoConstraints = false
        c1.translatesAutoresizingMaskIntoConstraints = false
        c2.translatesAutoresizingMaskIntoConstraints = false
        c3.translatesAutoresizingMaskIntoConstraints = false
        
        VStack.axis = .vertical
        VStack.spacing = 8
        VStack.distribution = .fillEqually
        VStack.backgroundColor = .label
        HStackA.axis = .horizontal
        HStackA.spacing = 8
        HStackA.distribution = .fillEqually
        HStackB.axis = .horizontal
        HStackB.spacing = 8
        HStackB.distribution = .fillEqually
        HStackC.axis = .horizontal
        HStackC.spacing = 8
        HStackC.distribution = .fillEqually
        
        //Vstack constrain(Outer Board)
        let width = UIScreen.main.bounds.width * 0.9
        NSLayoutConstraint.activate([
            VStack.widthAnchor.constraint(equalToConstant: width),
            VStack.heightAnchor.constraint(equalToConstant: width),
            VStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            VStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: +70)
        ])
        
        
    }
    func makeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(" ", for: [])
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .systemBackground
        button.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
}

//MARK: - Actions
extension TicTacToeViewController {
    @objc func buttonTapped(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        if text == " " {
            sender.setTitle(playerSign, for: [])
            switchSide()
        }
    }
    func switchSide() {
        if playerSign == "X" {
            playerSign = "O"
        } else {
            playerSign = "X"
        }
    }
}
//MARK: - ChekingWinner && pop up alert
extension TicTacToeViewController {
    func checkIfWin() {
        
    }
}
