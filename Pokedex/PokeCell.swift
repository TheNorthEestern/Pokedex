//
//  PokeCell.swift
//  Pokedex
//
//  Created by Kacy James on 11/25/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    var cellPokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(modelPokemon: Pokemon) {
        cellPokemon = modelPokemon
        nameLabel.text = cellPokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(modelPokemon.pokedexId)")
    }
    
}
