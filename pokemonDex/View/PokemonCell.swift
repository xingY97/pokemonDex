//
//  PokemonCell.swift
//  pokemonDex
//
//  Created by X Y on 4/29/21.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokemonImageView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
