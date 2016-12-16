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
    private var _description: String!
    private var _type : String!
    private var _height: String!
    private var _weight: String!
    
    var description: String {
        return _description
    }
    
    var type: String {
        return _type
    }
    
    var height: String {
        return _height
    }
    
    var weight: String {
        return _weight
    }
    
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
