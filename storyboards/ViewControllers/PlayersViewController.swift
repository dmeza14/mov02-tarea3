//
//  PlayersViewController.swift
//  storyboards
//
//  Created by David Meza on 2/9/21.
//

import UIKit

class PlayersViewController: UITableViewController {

  var playersDataSource = PlayersDataSource()
}

extension PlayersViewController {
  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    playersDataSource.numberOfPlayers()
  }

  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "PlayerCell",
      for: indexPath) as! PlayerCell

   
    cell.player = playersDataSource.player(at: indexPath)
    return cell
  }
}

extension PlayersViewController {
  @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
  }

  @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
    guard
      let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
      let player = playerDetailsViewController.player
      else {
        return
    }
    playersDataSource.append(player: player, to: tableView)

  }
}

