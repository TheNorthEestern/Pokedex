//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Kacy James on 12/6/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: CLTypingLabel!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        nameLabel.text = pokemon.name.capitalized
        pokemonImage.image = UIImage(named: "\(pokemon.pokedexId)")

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
      dismiss(animated: true, completion: nil)
    }

}
