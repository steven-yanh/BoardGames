//
//  GameListViewController.swift
//  BoardGames
//
//  Created by Huang Yan on 10/4/22.
//

import UIKit
class GameListViewController: UIViewController {
    
    var tableView = UITableView()

    let game = GameList()
    var gamesViewModels = [GameListCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCellViewModels()
        setupTable()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.isHidden = false
    }
    func setupTable() {
        title = "Games"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GameListCell.self, forCellReuseIdentifier: GameListCell.reuseId)
        tableView.rowHeight = GameListCell.rowHeight
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func setupCellViewModels() {
        gamesViewModels = game.games.map { gameVC in
            return GameListCellViewModel(gameName: gameVC.getGameName(), imageName: gameVC.getGameImageName())
        }
    }
    
}
//MARK: - Table Data source
extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !game.games.isEmpty, !gamesViewModels.isEmpty else { return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GameListCell.reuseId, for: indexPath) as! GameListCell
        cell.configure(with: gamesViewModels[indexPath.row], for: cell)
        
        return cell
    }
    
    
}
//MARK: - Table Delegate Methods
extension GameListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(game.games[indexPath.row], animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.isHidden = true
    }
}
