//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Kacy James on 12/6/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: CLTypingLabel!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        nameLabel.text = pokemon.name
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }


}
