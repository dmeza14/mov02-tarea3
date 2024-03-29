//
//  PlayerDetailsViewController.swift
//  storyboards
//
//  Created by David Meza on 2/9/21.
//

import UIKit


class PlayerDetailsViewController: UITableViewController {
    var player: Player?
    
    var game = "" {
      didSet {
        detailLabel.text = game
      }
    }
    
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
      game = "Minecraft"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "SavePlayerDetail",
           let playerName = nameTextField.text,
           let gameName = detailLabel.text {
          player = Player(name: playerName, game: gameName, rating: 1)
        }

      if segue.identifier == "PickGame",
         let gamePickerViewController = segue.destination as? GamePickerViewController {
        gamePickerViewController.gamesDataSource.selectedGame = game
      }
    }

}

extension PlayerDetailsViewController {
  @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
    if let gamePickerViewController = segue.source as? GamePickerViewController,
       let selectedGame = gamePickerViewController.gamesDataSource.selectedGame {
      game = selectedGame
    }
  }
}

