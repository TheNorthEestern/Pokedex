//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kacy James on 11/21/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _types : [Dictionary<String, String>]!
    private var _computedType : String! = ""
    private var _height: String!
    private var _weight: String!
    private var _pokemonURL: String!
    var description: String {
        return _description
    }
    
    var types: [Dictionary<String, String>] {
        return _types
    }
    
    var computedType: String {
        return _computedType.capitalized
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
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] {
                    for (index, type) in types.enumerated() {
                        print(type["name"]!)
                        self._computedType = self._computedType! + (type["name"]?.capitalized)!
                        if index < types.count - 1 {
                            print(index, types.count)
                            self._computedType = self._computedType + "/"
                        }
                    }
                    self._computedType = self._computedType + " Pokemon"
                }
            }
            completed()
        }
    }
}
