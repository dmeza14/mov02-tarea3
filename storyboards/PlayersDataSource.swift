//
//  PlayersDataSource.swift
//  storyboards
//
//  Created by David Meza on 2/9/21.
//

import UIKit

class PlayersDataSource: NSObject {
  // MARK: - Properties
  var players: [Player]

  static func generatePlayersData() -> [Player] {
    return [
      Player(name: "David", game: "Rocket League", rating: 4),
      Player(name: "Gabriel", game: "Call of Duty", rating: 2),
      Player(name: "Jona", game: "Minecraft", rating: 5)
    ]
  }

  
  override init() {
    players = PlayersDataSource.generatePlayersData()
  }

  // MARK: - Datasource Methods
  func numberOfPlayers() -> Int {
    players.count
  }

  func append(player: Player, to tableView: UITableView) {
    players.append(player)
    tableView.insertRows(at: [IndexPath(row: players.count-1, section: 0)], with: .automatic)
  }

  func player(at indexPath: IndexPath) -> Player {
    players[indexPath.row]
  }
}
