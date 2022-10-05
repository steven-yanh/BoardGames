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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    func setupTable() {
        title = "Games"
        tableView.dataSource = self
        tableView.delegate = self
        print(game.games.count)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
//MARK: - Table Data source
extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell()
        cell.textLabel?.text = game.games[indexPath.row].getGameName()
        return cell
    }
    
    
}
//MARK: - Table Delegate Methods
extension GameListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(game.games[indexPath.row], animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
