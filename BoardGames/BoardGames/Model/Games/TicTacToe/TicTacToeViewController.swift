//
//  TicTacToeViewController.swift
//  BoardGames
//
//  Created by Huang Yan on 10/2/22.
//

import UIKit

class TicTacToeViewController: GameViewController {
    
    //title components
    let XLabel = UILabel()
    let scoreLabel = UILabel()
    let turnArrow = UIImageView()
    let OLabel = UILabel()
    let resetButton = UIButton()
    var arrowConstrain: NSLayoutConstraint?
    var leftPoint: CGFloat = 8
    var rightPoint: CGFloat = 320
    var didMove = false
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
    
    var currentPlayer = "X"
    var roundForPlayer = "X"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupBoard()
        setupResetButton()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupArrowPosition()
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
    private func setupResetButton() {
        resetButton.setTitle("Reset", for: [])
        resetButton.addTarget(self, action: #selector(resetBoard), for: .touchUpInside)
        resetButton.backgroundColor = .tintColor
        resetButton.layer.cornerRadius = 15
        
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalToSystemSpacingBelow: scoreLabel.bottomAnchor, multiplier: 2),
            resetButton.centerXAnchor.constraint(equalTo: scoreLabel.centerXAnchor),
            resetButton.widthAnchor.constraint(equalToConstant: 70), // According to Apple's formal document button should have at least 44 x 44
            resetButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    func setupArrowPosition() {
        leftPoint = XLabel.frame.minX + 8
        rightPoint = OLabel.frame.minX + 8
        arrowConstrain = turnArrow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftPoint)
        arrowConstrain?.isActive = true
    }
    private func makeButton() -> UIButton {
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
            didMove = true
            sender.titleLabel?.text = currentPlayer
            sender.setTitle(currentPlayer, for: .normal)
            if checkIfWin() {
                ScorePlus()
                displayResult(title: "We have a winner!", message: currentPlayer + " Player win!", winner: currentPlayer)
            } else if isFull() {
                displayResult(title: "Tie!", message: "No winner for this round")
            } else {
                switchSide()
            }
        }
    }
    func switchSide() {
        if currentPlayer == "X" {
            animateArrow(to: rightPoint)
            currentPlayer = "O"
        } else {
            animateArrow(to: leftPoint)
            currentPlayer = "X"
        }
    }
    
}

//MARK: - win handling and reset board
extension TicTacToeViewController {
    private func displayResult(title: String, message: String, winner: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Reset", style: .default) { action in
            DispatchQueue.main.async {
                self.resetButtons()
                self.resetForNextPlayer(winner: winner)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func startFor(player: String) {
        let startPoint: CGFloat
        if player == "X" {
            startPoint = leftPoint
            roundForPlayer = "X"
            currentPlayer = "X"
        } else {
            startPoint = rightPoint
            roundForPlayer = "O"
            currentPlayer = "O"
        }
        arrowConstrain?.constant = startPoint
    }
    private func ScorePlus() {
        if currentPlayer == "X" {
            xScoreInt += 1
        } else {
            oScoreInt += 1
        }
    }
}

//MARK: - Button Extension
extension UIButton {
    func getText() -> String {
        return titleLabel?.text ?? ""
    }
}
