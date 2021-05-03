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
    
    var pokemon: PokemonData?{
        didSet {
            nameLabel.text = pokemon?.name
            idLabel.text = "\(pokemon?.id ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
