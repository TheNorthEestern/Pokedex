//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kacy James on 11/21/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init (name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}
