//
//  PokemonCell.swift
//  pokemonDex
//
//  Created by X Y on 4/29/21.
//

import UIKit
import Kingfisher

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: PokemonData?{
        didSet {
            nameLabel.text = pokemon?.name
            idLabel.text = "\(pokemon?.id ?? 0)"
            if let image = pokemon?.sprites?.frontDefault, let url = URL(string: image) {
                pokemonImageView.kf.setImage(with: url)
            }
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

