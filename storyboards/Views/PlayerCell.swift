//
//  PlayerCell.swift
//  storyboards
//
//  Created by David Meza on 2/9/21.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    // 1:
    var player: Player? {
      didSet {
        guard let player = player else { return }

        gameLabel.text = player.game
        nameLabel.text = player.name
        ratingImageView.image = image(forRating: player.rating)
      }
    }

    // 2:
    private func image(forRating rating: Int) -> UIImage? {
      let imageName = "\(rating)Stars"
      return UIImage(named: imageName)
    }

    

}
