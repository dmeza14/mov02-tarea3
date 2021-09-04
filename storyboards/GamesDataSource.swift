//
//  GamesDataSource.swift
//  storyboards
//
//  Created by David Meza on 2/9/21.
//

import UIKit

class GamesDataSource: NSObject {
  
  var games = [
    "Last of Us",
    "FIFA 2021",
    "Among Us",
    "Rocket League",
    "Minecraft",
    "Call of Duty"
  ]

  var selectedGame: String? {
    didSet {
      if let selectedGame = selectedGame,
        let index = games.firstIndex(of: selectedGame) {
        selectedGameIndex = index
      }
    }
  }

  var selectedGameIndex: Int?

  //Métodos
  func selectGame(at indexPath: IndexPath) {
    selectedGame = games[indexPath.row]
  }

  func numberOfGames() -> Int {
    games.count
  }

  func gameName(at indexPath: IndexPath) -> String {
    games[indexPath.row]
  }
}
