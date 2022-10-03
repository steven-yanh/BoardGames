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
    
    lazy var i0: UIButton = { return makeButton() }()
    lazy var i1: UIButton = { return makeButton() }()
    lazy var i2: UIButton = { return makeButton() }()
    lazy var i3: UIButton = { return makeButton() }()
    lazy var i4: UIButton = { return makeButton() }()
    lazy var i5: UIButton = { return makeButton() }()
    lazy var i6: UIButton = { return makeButton() }()
    lazy var i7: UIButton = { return makeButton() }()
    lazy var i8: UIButton = { return makeButton() }()
    
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
        HStackA.addArrangedSubview(i0)
        HStackA.addArrangedSubview(i1)
        HStackA.addArrangedSubview(i2)
        VStack.addArrangedSubview(HStackB)
        HStackB.addArrangedSubview(i3)
        HStackB.addArrangedSubview(i4)
        HStackB.addArrangedSubview(i5)
        VStack.addArrangedSubview(HStackC)
        HStackC.addArrangedSubview(i6)
        HStackC.addArrangedSubview(i7)
        HStackC.addArrangedSubview(i8)
        
        VStack.translatesAutoresizingMaskIntoConstraints = false
        HStackA.translatesAutoresizingMaskIntoConstraints = false
        HStackB.translatesAutoresizingMaskIntoConstraints = false
        HStackC.translatesAutoresizingMaskIntoConstraints = false
        i0.translatesAutoresizingMaskIntoConstraints = false
        i1.translatesAutoresizingMaskIntoConstraints = false
        i2.translatesAutoresizingMaskIntoConstraints = false
        i3.translatesAutoresizingMaskIntoConstraints = false
        i4.translatesAutoresizingMaskIntoConstraints = false
        i5.translatesAutoresizingMaskIntoConstraints = false
        i6.translatesAutoresizingMaskIntoConstraints = false
        i7.translatesAutoresizingMaskIntoConstraints = false
        i8.translatesAutoresizingMaskIntoConstraints = false
        
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
        button.setTitle(" ", for: .normal)
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
            sender.titleLabel?.text = playerSign
            sender.setTitle(playerSign, for: .normal)
        }
        checkIfWin()
        switchSide()
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
        let boardString = makeArr()
        if checkHorizontal(from: 0, boardString) || checkHorizontal(from: 3, boardString) || checkHorizontal(from: 6, boardString) {
            print("win")
        }
        if checkVertical(from: 0, boardString) || checkVertical(from: 1, boardString) || checkVertical(from: 2, boardString) {
            print("Vwin")
        }
        if checkDiagonal(boardString) {
            print("dWin")
        }
    }
    func makeArr() -> [String] {
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
    func checkHorizontal(from index:Int, _ boardString: [String]) -> Bool {
        if boardString[index] == boardString[index+1] && boardString[index+1] == boardString[index+2] && boardString[index] != " " {
            return true
        }
        return false
    }
    func checkVertical(from index: Int, _ boardString: [String]) -> Bool {
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

extension UIButton {
    func getText() -> String {
        return titleLabel?.text ?? ""
    }
}
